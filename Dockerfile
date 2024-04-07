FROM ubuntu:latest

# Copy pufferpanel file
COPY pufferpanel.sh /usr/local/bin/pufferpanel.sh

# Update and install necessary packages
RUN apt update -y && \
    apt upgrade -y && \
    apt install -y git wget curl sudo systemd && \
    apt clean

# Set permissions for pufferpanel script
RUN chmod +x /usr/local/bin/pufferpanel.sh

# Run pufferpanel script
CMD /usr/local/bin/pufferpanel.sh && \
    sudo systemctl start && \
    sudo systemctl enable && \
    sudo systemctl status

# Expose port 8080 after pufferpanel script is successfully executed
EXPOSE 8080
