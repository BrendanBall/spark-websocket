FROM openjdk:8-jre

WORKDIR /app

ADD build/distributions/sparksocket-1.0-SNAPSHOT.tar /app/

EXPOSE 8080

CMD ["java", "-jar", "sparksocket-1.0-SNAPSHOT/lib/sparksocket-1.0-SNAPSHOT.jar", "-Djetty.port=8080"]