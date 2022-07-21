FROM openjdk:17-slim AS my_build

COPY . /app
WORKDIR /app
RUN ./gradlew build

FROM openjdk:17-slim

RUN mkdir /app
WORKDIR /app
COPY --from=my_build /app/build/libs/spring-boot-0.0.1-SNAPSHOT.jar /app/spring-boot-0.0.1-SNAPSHOT.jar

CMD ["java", "-jar", "/app/spring-boot-0.0.1-SNAPSHOT.jar"]