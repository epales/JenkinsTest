FROM openjdk:8u302

ARG VERSION

COPY target/*.jar /app/app.jar

ENV APP_HOME /app
EXPOSE 8080
VOLUME /app/upload

WORKDIR $APP_HOME
ENTRYPOINT ["java"]
CMD ["-jar", "app.jar"]
