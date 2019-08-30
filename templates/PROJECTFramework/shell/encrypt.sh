#!/bin/sh

#  encrypt.sh
#  PROJECT
#
#  Created by PROJECT_OWNER on TODAYS_DATE.
#  Copyright (c) TODAYS_YEAR PROJECT_OWNER. All rights reserved.


#
# 加密配置文件
#

# 加密后的配置文件将被打包到此 bundle 资源文件中
bundle=$1 #"${SRCROOT}/web/csair.bundle"
# 将要加密的插件配置文件
src_manifest=$2 #./CSAIR/web/manifest.xml
# 加密后的配置文件路径
en_manifest="$bundle/manifest"
# IS_SOURCE 为 1，表示会把插件未加密的配置文件源文件一起打包到bundle， 否则只打包经过加密的插件配置文件源文件
is_source=$3


# 这里的-d 参数判断$bundle是否存在
if [ ! -d "$bundle" ]; then
    echo "文件夹不存在: $bundle"
    mkdir -p "$bundle"
else
    echo "文件夹已经存在: $bundle"
fi
chmod -R 777 "$bundle"

if [ -f "$en_manifest" ]; then
    echo "已有加密文件，将被删除: $en_manifest"
    rm "$en_manifest"
fi

#加密
./shell/Encrypt -k "D9BE8506F23AE5CC2016DA90B453BA04" -in "$src_manifest" -out "$en_manifest"
