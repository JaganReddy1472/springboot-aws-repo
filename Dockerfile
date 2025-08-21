FROM eclipse-temurin:17-jdk-alpine

# Install curl with apk
RUN apk add --no-cache curl

VOLUME /temp
EXPOSE 8080

COPY target/springboot-aws-repo-service.jar springboot-aws-repo-service.jar
ENTRYPOINT ["java", "-jar", "springboot-aws-repo-service.jar"]
