# Multi-stage build
FROM maven:3.8.6-eclipse-temurin-17 AS build
WORKDIR /app

# Copy Maven files first for better caching
COPY pom.xml .
RUN mvn dependency:go-offline -B

# Copy source code and build
COPY src ./src
RUN mvn clean package -DskipTests -B

# Runtime stage
FROM eclipse-temurin:17-jdk-alpine
RUN apk add --no-cache curl

VOLUME /tmp
EXPOSE 8080

# Copy the built JAR from build stage
COPY --from=build /app/target/springboot-aws-repo-service.jar app.jar

ENTRYPOINT ["java", "-jar", "/app.jar"]