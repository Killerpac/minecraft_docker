# Use the official Alpine 3.16 image as the base image
FROM alpine:3.16

# Set the working directory to /app
WORKDIR /server

# Add the community repository to the Alpine package sources
RUN echo "http://dl-cdn.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories

# Install OpenJDK 17
RUN apk add --no-cache openjdk17

# Download the Minecraft server jar file
RUN wget https://api.purpurmc.org/v2/purpur/1.19.3/latest/download -O minecraft_server.jar

# Create EULA file with EULA set to false
RUN echo "eula=false" > eula.txt

# Set EULA to true
RUN sed -i 's/eula=false/eula=true/g' eula.txt

# Create server.properties with online-mode set to false
RUN echo "online-mode=false" > server.properties

# Download the SpigotDash plugin
RUN mkdir plugins && \
    wget "https://drive.google.com/uc?export=download&id=1kop8bdS3IFRGrfHXSmgit6j5RzdzhgTG" -O plugins/spigotdash.jar 

# Start the Minecraft server
CMD ["java", "-Xmx1024M", "-Xms1024M", "-jar", "minecraft_server.jar", "nogui"]
