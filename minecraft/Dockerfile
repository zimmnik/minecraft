FROM 	bellsoft/liberica-openjdk-alpine-musl:latest

WORKDIR /opt/minecraft

COPY	files .
RUN	/opt/minecraft/run.sh && rm -v /opt/minecraft/run.sh

VOLUME /opt/minecraft/world

EXPOSE	25565

CMD	[ "java", "-Xmx1024M", "-Xms1024M", "-jar", "server.jar", "nogui" ]
