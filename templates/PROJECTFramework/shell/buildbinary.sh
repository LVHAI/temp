#!/bin/sh

#  buildbinary.sh
#  PROJECT
#
#  Created by PROJECT_OWNER on TODAYS_DATE.
#  Copyright (c) TODAYS_YEAR PROJECT_OWNER. All rights reserved.

#
# 构建 工程framework
#

#获取当前文件夹名
shell_dir=${PWD##*/}
if [[ "$shell_dir" == "shell" ]];then
cd ../
fi

var=`echo $PWD/*.podspec`
BUNDLE_PRO_NAME=`echo $(basename ${var} .podspec)`
#BUNDLE_PRO_NAME=${PWD##*/}
echo "build binary: ${BUNDLE_PRO_NAME}, path: $PWD"

cd shell

BINARY_NAME="${BUNDLE_PRO_NAME}"
FRAMEWORK_NAME="${BUNDLE_PRO_NAME}.framework"

INSTALL_DIR=$PWD/../Products
#rm -fr "${INSTALL_DIR}"
#mkdir $INSTALL_DIR

WRK_DIR=$PWD/../build
rm -fr "${WRK_DIR}"
mkdir $WRK_DIR

BUILD_PATH=${WRK_DIR}

DEVICE_INCLUDE_DIR=${BUILD_PATH}/Release-iphoneos/usr/local/include
DEVICE_DIR=${BUILD_PATH}/Release-iphoneos/${FRAMEWORK_NAME}
DE_SIMULATOR_DIR=${BUILD_PATH}/Debug-iphonesimulator/${FRAMEWORK_NAME}
SIMULATOR_DIR=${BUILD_PATH}/Release-iphonesimulator/${FRAMEWORK_NAME}
RE_OS="Release-iphoneos"
DE_SIMULATOR="Debug-iphonesimulator"
RE_SIMULATOR="Release-iphonesimulator"

cd ../

xcodebuild -configuration "Release" -workspace "${BUNDLE_PRO_NAME}.xcworkspace" -scheme "${BINARY_NAME}" -sdk iphoneos clean build CONFIGURATION_BUILD_DIR="${WRK_DIR}/${RE_OS}" LIBRARY_SEARCH_PATHS="./Pods/build/${RE_OS}" -UseModernBuildSystem=NO
ret=$?
if [ "$ret" -ne "0" ];then
exit 1
fi

xcodebuild ARCHS=x86_64 ONLY_ACTIVE_ARCH=NO -configuration "Debug" -workspace "${BUNDLE_PRO_NAME}.xcworkspace" -scheme "${BINARY_NAME}" -sdk iphonesimulator clean build CONFIGURATION_BUILD_DIR="${WRK_DIR}/${DE_SIMULATOR}" LIBRARY_SEARCH_PATHS="./Pods/build/${DE_SIMULATOR}" -UseModernBuildSystem=NO
ret=$?
if [ "$ret" -ne "0" ];then
exit 1
fi

#xcodebuild ARCHS=x86_64 ONLY_ACTIVE_ARCH=NO -configuration "Release" -workspace "${BUNDLE_PRO_NAME}.xcworkspace" -scheme "${BINARY_NAME}" -sdk iphonesimulator clean build CONFIGURATION_BUILD_DIR="${WRK_DIR}/${RE_SIMULATOR}" LIBRARY_SEARCH_PATHS="./Pods/build/${RE_SIMULATOR}"

if [ -d "${INSTALL_DIR}" ];then
rm -rf ${INSTALL_DIR}/*.framework
else
mkdir -p "${INSTALL_DIR}"
fi


lipo -create "${DEVICE_DIR}/${BUNDLE_PRO_NAME}" "${DE_SIMULATOR_DIR}/${BUNDLE_PRO_NAME}" -output "${DEVICE_DIR}/${BUNDLE_PRO_NAME}"
#lipo -create "${DEVICE_DIR}/${BUNDLE_PRO_NAME}" "${SIMULATOR_DIR}/${BUNDLE_PRO_NAME}" -output "${DEVICE_DIR}/${BUNDLE_PRO_NAME}"
cp -rp "${DEVICE_DIR}" "${INSTALL_DIR}"
rm -r "${WRK_DIR}"
rm -rf ${INSTALL_DIR}/${FRAMEWORK_NAME}/*.bundle

echo  "\033[34m ${BUNDLE_PRO_NAME} build binary success! \033[0m"
cd shell

