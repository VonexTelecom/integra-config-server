FROM openjdk:8-jdk-alpine

ENV TZ='GMT-3'

VOLUME /tmp

EXPOSE 8088

ARG JAR_FILE=target/*.jar

ADD ${JAR_FILE} api-config-server.jar

ENTRYPOINT ["java","-Xmx256M","-jar","/api-config-server.jar"]
