FROM openjdk:17-slim

RUN mkdir /app
WORKDIR /app
COPY build/libs/spring-boot-0.0.1-SNAPSHOT.jar /app/spring-boot-0.0.1-SNAPSHOT.jar

CMD ["java", "-jar", "/app/spring-boot-0.0.1-SNAPSHOT.jar"]