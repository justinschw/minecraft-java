FROM alpine:latest

WORKDIR /app

COPY eula.txt /app/data/eula.txt
COPY server.properties /app/data/server.properties

RUN apk update && \
    apk add openjdk17-jre libgudev && \
    adduser -D minecraft && \
    wget https://piston-data.mojang.com/v1/objects/8dd1a28015f51b1803213892b50b7b4fc76e594d/server.jar -O /app/server.jar && \
    chown -R minecraft:minecraft /app

USER minecraft

EXPOSE 25565

WORKDIR /app/data

CMD ["/usr/bin/java", "-Xmx1024M", "-Xms1024M", "-jar", "/app/server.jar", "nogui"]
