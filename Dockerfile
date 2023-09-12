FROM openjdk:17
LABEL maintainer="Bharath Kalyan S"
COPY ./target/jenkins-0.0.1-SNAPSHOT.jar app.jar
ENTRYPOINT ["java","-jar","/app.jar"]