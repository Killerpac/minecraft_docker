FROM ghcr.io/graalvm/graalvm-ce:22.3.1 as graalvm

WORKDIR /server

#run the minecraft server
CMD java -XX:+UseContainerSupport -XX:MaxRAMPercentage=75 -jar server.jar nogui

# Path: Dockerfile

