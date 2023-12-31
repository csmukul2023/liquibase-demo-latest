FROM maven:3.6.3-jdk-11-slim
WORKDIR usr/src/app
COPY . ./
RUN mvn clean package

FROM openjdk:11-jre-slim
ARG JAR_NAME="liquibase-springboot"
WORKDIR /usr/src/app
COPY --from=build /usr/src/app/target/${JAR_NAME}.jar ./app.jar
CMD ["java","-jar", "./app.jar"]
