FROM openjdk:8u302

ARG VERSION

COPY target/JenkinsTest-0.0.1-SNAPSHOT.jar /app/JenkinsTest.jar

ENV APP_HOME /app
EXPOSE 8080
VOLUME /app/upload

WORKDIR $APP_HOME
ENTRYPOINT ["java"]
CMD ["-jar", "JenkinsTest.jar"]
