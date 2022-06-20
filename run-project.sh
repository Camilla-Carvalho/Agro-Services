echo "Projeto Agro-Services API"

sudo semanage fcontext -a -t container_file_t ./mysql_data
sudo restorecon -Rv ./mysql_data

mvn spring-boot:run