

# 验证二进制模式的 Podspec 之前需要先构建二进制包，以便podspec能获取对应的路径的文件
sh ./buildbinary.sh

cd ../

sh ./shell/clean_cache.sh

SOURCES='git@gitlab.com:cnstar/ZCMRepos.git,master'
pod lib lint --sources=$SOURCES --verbose --use-libraries --fail-fast --allow-warnings --no-clean

cd shell
