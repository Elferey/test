FROM maven:3.8.7-openjdk-18-slim as maven_builder
ENV CATALINA_HOME="/usr/local/tomcat"
WORKDIR $CATALINA_HOME
ADD . $CATALINA_HOME
RUN mvn package

FROM tomcat:9
ENV CATALINA_HOME="/usr/local/tomcat"
RUN mkdir -p $CATALINA_HOME
WORKDIR $CATALINA_HOME
COPY --from=maven_builder $CATALINA_HOME/target/*.war $CATALINA_HOME/webapps
EXPOSE 8080
CMD ["catalina.sh", "run"]