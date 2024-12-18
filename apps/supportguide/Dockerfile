FROM mcr.microsoft.com/openjdk/jdk:17-ubuntu
VOLUME /tmp
COPY target/supportguide.jar app.jar

EXPOSE 9090

ENTRYPOINT ["java", "-jar", "/app.jar"]
