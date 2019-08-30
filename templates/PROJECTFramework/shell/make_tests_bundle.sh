#!/bin/sh

#  make_tests_bundle.sh
#  PROJECT
#
#  Created by PROJECT_OWNER on TODAYS_DATE.
#  Copyright (c) TODAYS_YEAR PROJECT_OWNER. All rights reserved.


#
# 构建 单元测试的插件配置加密包
#

./shell/encrypt.sh "./PROJECT/Assets/PROJECT.bundle" "./PROJECT/Assets/manifest.xml"
./shell/copy_manifest_to_proj.sh "${SRCROOT}/PROJECT/Assets/PROJECT.bundle"

./shell/encrypt.sh "${SRCROOT}/PROJECTTests/PROJECTTests.bundle" "${SRCROOT}/PROJECTTests/manifest.xml"
./shell/copy_manifest_to_proj.sh "${SRCROOT}/PROJECTTests/PROJECTTests.bundle"

