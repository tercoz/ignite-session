FROM openjdk:8-jdk-alpine as build-backend
COPY /src /src
COPY /pom.xml /pom.xml
COPY /.mvn /.mvn
COPY /mvnw /mvnw
RUN ./mvnw package

FROM openjdk:8-jre-alpine
COPY --from=build-backend /target/app.jar /opt/app.jar

ENTRYPOINT ["java", "-jar", "/opt/app.jar"]