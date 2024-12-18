FROM mcr.microsoft.com/openjdk/jdk:17-ubuntu
VOLUME /tmp
COPY target/supportguide.jar app.jar

# Add ports to expose
EXPOSE 9090

ENTRYPOINT ["java", "-jar", "/app.jar"]
