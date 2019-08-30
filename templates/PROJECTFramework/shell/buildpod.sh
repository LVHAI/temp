#!/bin/sh

#  buildpod.sh
#  PROJECT
#
#  Created by PROJECT_OWNER on TODAYS_DATE.
#  Copyright (c) TODAYS_YEAR PROJECT_OWNER. All rights reserved.

#
# 构建 framework， 并发布 Pod
#

shell_dir=${PWD##*/}
if [[ "$shell_dir" == "shell" ]];then
cd ../
fi

var=`echo $PWD/*.podspec`
BUNDLE_PRO_NAME=`echo $(basename ${var} .podspec)`
#BUNDLE_PRO_NAME=${PWD##*/}
cd shell

echo  " ---- begin build pod: ${BUNDLE_PRO_NAME}, path: $PWD ---- "


# 构建 二进制 framework
sh ./buildbinary.sh
ret=$?
if [ "$ret" -ne "0" ];then
echo  "\033[31m build framework: ${BUNDLE_PRO_NAME} fail,please check. \033[0m"
exit 1
fi

sh ./build_resources.sh
ret=$?
if [ "$ret" -ne "0" ];then
echo -e "\033[31m build resources: ${BUNDLE_PRO_NAME} fail,please check. \033[0m"
exit 1
fi

cd ../

sh ./shell/clean_cache.sh

#执行插件配置文件自动加密脚本，源码模式下 把没有经过加密的配置文件也打包到bundle
sh ./shell/make_pod_bundle.sh "1"
ret=$?
if [ "$ret" -ne "0" ];then
echo -e "\033[31m make pod bundle encrypt: ${BUNDLE_PRO_NAME} fail,please check. \033[0m"
exit 1
fi


pushd "$(dirname "$0")" > /dev/null
SCRIPT_DIR=$(pwd -L)
popd > /dev/null

git config --get user.name
git config --get user.email


CURRENT_POD_VERSION=$(cat $BUNDLE_PRO_NAME.podspec | grep 's.version' | grep -o '[0-9]*\.[0-9]*\.[0-9]*' -m 1)
echo "$BUNDLE_PRO_NAME version: $CURRENT_POD_VERSION"

# 提交改动到 gitlab
#git push origin --delete tag $CURRENT_POD_VERSION
#git tag -d $CURRENT_POD_VERSION
git add .
git commit -m "版本: $CURRENT_POD_VERSION; $1"
git push
# 给版本打 tag
git tag -a $CURRENT_POD_VERSION -m "版本: $CURRENT_POD_VERSION"
ret=$?
if [ "$ret" -ne "0" ];then
echo "\033[31m $BUNDLE_PRO_NAME push tag $CURRENT_POD_VERSION fail,please check. \033[0m"
exit 1
fi

git push origin $CURRENT_POD_VERSION
ret=$?
if [ "$ret" -ne "0" ];then
echo "\033[31m $BUNDLE_PRO_NAME git push origin fail,please check. \033[0m"
exit 1
fi

# 发布 Pod
pod repo push ZCMRepos $BUNDLE_PRO_NAME.podspec --verbose --use-libraries --allow-warnings

ret=$?

if [ "$ret" -ne "0" ];then
echo "\033[31m publish repo $BUNDLE_PRO_NAME fail,please check. \033[0m"
exit 1
fi

echo "\033[34m publish repo $BUNDLE_PRO_NAME version: $CURRENT_POD_VERSION success! \033[0m"
cd shell
