FROM itzg/minecraft-server

# Install Java
RUN apt-get update && \
    apt-get install -y openjdk-16-jdk && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Set environment variables
ENV EULA=true \
    MEMORY=2G

# Expose the Minecraft server port
EXPOSE 25565

# Start the Minecraft server
CMD ["java", "-Xmx${MEMORY}", "-Xms${MEMORY}", "-jar", "/minecraft-server/${SERVER_JARFILE}", "nogui"]
