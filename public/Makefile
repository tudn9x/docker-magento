chmod:
	@chmod -R 777 ./magento/var ./magento/generated ./magento/pub/static ./magento/pub/media ./magento/vendor
upg:
	php -d memory_limit=-1 magento/bin/magento setup:upgrade --keep-generated
rm:
	rm -rf magento/pub/static/_cache/*
	rm -rf magento/pub/static/_requirejs/*
	rm -rf magento/pub/static/frontend/*
	rm -rf magento/pub/static/adminhtml/*
	rm -rf magento/pub/static/vendors/*
	rm -rf magento/var/view_preprocessed/*
	rm -rf magento/var/page_cache/*
	rm -rf magento/generated/*
dp: rm
	php -d memory_limit=-1 magento/bin/magento setup:static-content:deploy en_US ko_KR ja_JP zh_Hant_TW -f
ri:
	php -d memory_limit=-1 magento/bin/magento indexer:reindex
cf:
	php -d memory_limit=-1 magento/bin/magento cache:flush
di:
	php -d memory_limit=-1 magento/bin/magento setup:di:compile
cr:
	php -d memory_limit=-1 magento/bin/magento cron:run
cc: rm cf chmod

rg: chmod
	rm -rf magento/generated/*

deploy: chmod upg ri cf dp chmod
