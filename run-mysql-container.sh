podman run -d \
--name mysql-8 \
-p 3306:3306 \
-v ./mysql_data:/var/lib/mysql \
-e MYSQL_ROOT_PASSWORD='agro' \
mysql:8