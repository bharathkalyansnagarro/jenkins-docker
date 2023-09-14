# FROM openjdk:17
FROM amazoncorretto:20.0.2-alpine3.18
LABEL maintainer="Bharath Kalyan S"
COPY ./target/jenkins-0.0.1-SNAPSHOT.jar app.jar
ENTRYPOINT ["java","-jar","/app.jar"]
