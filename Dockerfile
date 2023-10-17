FROM amazoncorretto:19-alpine-jdk as build

WORKDIR /app

COPY Volumen/Main.java /app/

RUN javac /app/Main.java

FROM amazoncorretto:19-alpine-jdk as execute

WORKDIR /app

COPY --from=build /app/Main.class /app/Main.class

CMD ls

ENTRYPOINT ["java", "Main"]