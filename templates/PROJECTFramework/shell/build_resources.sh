#!/bin/sh

#  buildpod.sh
#  PROJECT
#
#  Created by PROJECT_OWNER on TODAYS_DATE.
#  Copyright (c) TODAYS_YEAR PROJECT_OWNER. All rights reserved.

#
# 编译资源文件
#

shell_dir=${PWD##*/}
if [[ "$shell_dir" == "shell" ]];then
cd ../
fi

var=`echo $PWD/*.podspec`
BUNDLE_PRO_NAME=`echo $(basename ${var} .podspec)`
cd shell

BINARY_NAME="${BUNDLE_PRO_NAME}Resources"
echo "build resources: ${BUNDLE_PRO_NAME}, path: $PWD"

BUNDLE_NAME="${BINARY_NAME}.bundle"


INSTALL_DIR=$PWD/../Products

WRK_DIR=$PWD/../build
rm -fr "${WRK_DIR}"
mkdir $WRK_DIR

BUILD_PATH=${WRK_DIR}

DEVICE_DIR=${BUILD_PATH}/Release-iphoneos/${BUNDLE_NAME}
RE_OS="Release-iphoneos"

cd ../

xcodebuild -configuration "Release" -project "${BUNDLE_PRO_NAME}.xcodeproj" -scheme "${BINARY_NAME}" -sdk iphoneos clean build  CONFIGURATION_BUILD_DIR="${WRK_DIR}/${RE_OS}" LIBRARY_SEARCH_PATHS="./Pods/build/${RE_OS}" -UseModernBuildSystem=NO
ret=$?
if [ "$ret" -ne "0" ];then
exit 1
fi

if [ -d "${INSTALL_DIR}" ];then
rm -rf ${INSTALL_DIR}/${BUNDLE_NAME}
else
mkdir -p "${INSTALL_DIR}"
fi

cp -rp "${DEVICE_DIR}" "${INSTALL_DIR}/${BUNDLE_NAME}"
rm -r "${WRK_DIR}"

echo  "\033[34m ${BUNDLE_PRO_NAME} build resources success! \033[0m"
cd shell
