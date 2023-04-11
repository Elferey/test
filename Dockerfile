FROM eclipse-temurin:17-jre-alpine
ADD . .
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "target/example.smallest-0.0.1-SNAPSHOT.jar"]