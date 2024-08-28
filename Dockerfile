# Use the latest Ubuntu image
FROM ubuntu:latest

# Set the working directory
WORKDIR /app

# Install Node.js and npm
RUN apt-get update && \
    apt-get install -y curl && \
    curl -sL https://deb.nodesource.com/setup_14.x | bash - && \
    apt-get install -y nodejs && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Copy the bot script to the container
COPY bot.js /app/

# Expose port 6969
EXPOSE 6969

# Command to run the bot and log output to a file
CMD ["sh", "-c", "node bot.js > /app/bot.log 2>&1"]
