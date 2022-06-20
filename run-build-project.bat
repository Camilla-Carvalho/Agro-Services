// "Projeto Agro-Services API"

// criar rede dos containers
docker network create agro-services-network

// Iniciar um container MySQL:8
docker container run --name mysqldb --network agro-services-network -p 3306:3306 -e MYSQL_ROOT_PASSWORD=agro -e MYSQL_DATABASE=agroservices -d mysql:8

echo "Build APP"
mvn clean install

/ "Build Image"
docker build -t agro-services-api:1 --no-cache .

// Run APP
docker container run --network agro-services-network --name agro-services-api -p 8080:8080 -d agro-services-api
