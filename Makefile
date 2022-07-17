include .env
export

up:
	@echo "Docker Up"
	@docker-compose up -d
stop:
	@echo "Docker Stop"
	@docker-compose stop
restart:
	@echo "Docker Restart"
	@docker-compose restart
snd:
	@echo "Docker Stop and Down (stop and remove all container data - becaful)"
	@docker-compose down

backup:
	@echo "Backup database"
	@docker exec $(container_db) /usr/bin/mysqldump -u root --password=root magento > ./database/magento.sql
restore:
	@echo "Restore database"
	@cat ./database/magento.sql | docker exec -i $(container_db) /usr/bin/mysql -u root --password=root magento
go:
	@docker exec -it $(container_app) /bin/bash

goroot:
	@docker exec -u root -it $(container_app) /bin/bash

reload:
	@docker exec $(container_web) nginx -s reload
	
upg:
	@echo "Upgrade"
	@docker exec $(container_app) /usr/local/bin/php -d memory_limit=-1 /var/www/html/src/bin/magento setup:upgrade

deploy:
	@docker exec $(container_app) make -C /var/www/public deploy

godb:
	docker exec -it $(container_db) /bin/bash

mkcert:
	./config/mkcert -install
	./config/mkcert $(domain)