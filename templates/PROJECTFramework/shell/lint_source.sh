cd ../

sh ./shell/make_pod_bundle.sh "1"
sh ./shell/clean_cache.sh

SOURCES='git@gitlab.com:cnstar/ZCMRepos.git,master'
IS_SOURCE=1 pod lib lint --sources=$SOURCES --verbose --fail-fast --use-libraries --allow-warnings --no-clean

cd shell
