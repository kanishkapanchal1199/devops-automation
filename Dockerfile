FROM openjdk:8
WORKDIR /opt
ENV PORT 8001
EXPOSE 8001
COPY target/*.jar /opt/docker-jenkins-integration.jar
ENTRYPOINT exec java $JAVA_OPTS -jar docker-jenkins-integration.jar