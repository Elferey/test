FROM eclipse-temurin:17-jre-alpine
ADD . .
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "-Dspring.profiles.active=dev", "target/example.smallest-0.0.1-SNAPSHOT.jar"]