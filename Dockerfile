FROM imagenarium/jdk-maven:17 as build
ADD . .
RUN mvn package
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "target/example.smallest-0.0.1-SNAPSHOT.jar"]