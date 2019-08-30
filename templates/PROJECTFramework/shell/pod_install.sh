#!/bin/sh

#  pod_install.sh
#  PROJECT
#
#  Created by PROJECT_OWNER on TODAYS_DATE.
#  Copyright (c) TODAYS_YEAR PROJECT_OWNER. All rights reserved.

#
# 安装 Pod
#

#IS_SOURCE=1 IS_MANIFEST=0 sh ./pod_install.sh
#echo "#********************************************************"
#echo "#****使用终端运行：'IS_SOURCE=0 IS_MANIFEST=0 sh ./pod_install.sh' "
#echo "#****IS_SOURCE=0，使用'二进制模式'; "
#echo "#****IS_SOURCE=1，使用'源码模式';"
#echo "#****缺省情况下默认: 使用'二进制模式';"
#echo "#****当要发布App 时，请使用'IS_MANIFEST=0';"
#echo "#****因为'IS_MANIFEST=1'时 插件的配置文件没有加密;"
#echo "#********************************************************"

# 切换 二进制 和 源码模式，需要先删除 Pods/CSAIR文件夹， 然后 clean cache
#rm -rf ../Pods/CSAIR
#pod cache clean CSAIR
sh ./clean_cache.sh

cd ../
# IS_SOURCE 为 1，表示使用源码模式， 否则使用 二进制模式
$1 $2 pod install
cd shell
