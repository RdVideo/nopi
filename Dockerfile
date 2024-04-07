FROM ubuntu:latest

# Update and install necessary packages
RUN apt update -y && \
    apt upgrade -y && \
    apt install -y git wget curl sudo systemd && \
    apt clean

# Download and run pufferpanel script
RUN wget https://raw.githubusercontent.com/RdVideo/puffer/main/pufferpanel.sh && \
    chmod +x pufferpanel.sh && \
    ./pufferpanel.sh

# Expose port 8080 after pufferpanel script is successfully executed
EXPOSE 8080
