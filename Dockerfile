FROM taoqn/temurin-17-jdk-maven:3.8.6-alpine as build
ADD . .
RUN mvn package
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "-Dspring.profiles.active=dev", "target/example.smallest-0.0.1-SNAPSHOT.jar"]