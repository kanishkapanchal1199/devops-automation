FROM openjdk:8
WORKDIR /opt
ENV PORT 8001
EXPOSE 8001
COPY target/*.jar /opt/xml-parsing-rest-api.jar
ENTRYPOINT exec java $JAVA_OPTS -jar xml-parsing-rest-api.jar