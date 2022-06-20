FROM openjdk:11
ENV HOME_APP=/home
WORKDIR $HOME_APP
COPY target/Projeto-Agro-Servicos-API-0.0.1-SNAPSHOT.jar $HOME_APP/agro-services-api.jar
EXPOSE 8080
CMD ["java","-jar","agro-services-api.jar"]