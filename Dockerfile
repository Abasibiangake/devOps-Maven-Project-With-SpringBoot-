FROM maven:3.8.1-jdk-11-slim AS build
WORKDIR /app
COPY pom.xml .
RUN mvn dependency:go-offline
COPY src ./src
RUN mvn package

FROM openjdk:11-jre-slim
WORKDIR /app
COPY --from=build /app/target/my-webapp-1.0-SNAPSHOT.jar .
EXPOSE 8080
CMD ["java", "-jar", "my-webapp-1.0-SNAPSHOT.jar"]
