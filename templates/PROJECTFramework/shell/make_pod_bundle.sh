#!/bin/sh

#  make_pod_bundle.sh
#  PROJECT
#
#  Created by PROJECT_OWNER on TODAYS_DATE.
#  Copyright (c) TODAYS_YEAR PROJECT_OWNER. All rights reserved.


#
# 构建 要发布的Pod的插件配置加密包
# IS_SOURCE 为 1，表示会把插件未加密的配置文件源文件一起打包到bundle， 否则只打包经过加密的插件配置文件源文件
#

#
#chmod -R 777 ./shell/encrypt.sh
#chmod -R 777 ./shell/copy_manifest_to_proj.sh
#

is_source=$1

BUNDLE_KEY="AIR_BUNDLE="
BUNDLE_MANIFEST_KEY="AIR_BUNDLE_MANIFEST="

var=`echo $PWD/*.podspec`
BUNDLE_PRO_NAME=`echo $(basename ${var} .podspec)`
#BUNDLE_PRO_NAME=${PWD##*/}

BUNDLE=$(cat $BUNDLE_PRO_NAME.podspec | grep "$BUNDLE_KEY" | sed -e "s/$BUNDLE_KEY//g" | sed -e "s/'//g" | sed "s/[[:space:]]//g")
FULL_BUNDLE="${PWD}/$BUNDLE"

MANIFEST=$(cat $BUNDLE_PRO_NAME.podspec | grep "$BUNDLE_MANIFEST_KEY" | sed -e "s/$BUNDLE_MANIFEST_KEY//g" | sed -e "s/'//g" | sed "s/[[:space:]]//g")
FULL_MANIFEST="${PWD}/$MANIFEST"


./shell/encrypt.sh "$FULL_BUNDLE" "$FULL_MANIFEST" "$is_source"
ret=$?
if [ "$ret" -ne "0" ];then
exit 1
fi
#./shell/copy_manifest_to_proj.sh "$FULL_BUNDLE"
