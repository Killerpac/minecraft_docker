FROM ubuntu:latest
RUN apt-get update && apt-get install -y openjdk-17-jdk && apt-get install -y wget && apt-get install -y unzip && apt-get install -y git 

# git clone the repo
RUN git clone https://github.com/Killerpac/minecraft_docker

# run the minecraft server
WORKDIR minecraft_docker

CMD ["java", "-Xmx3500M", "-Xms1024M", "-jar", "server.jar", "nogui"]

EXPOSE 25565
EXPOSE 25575
EXPOSE 8080