#!/bin/bash

LOG_FILE="/var/log/stop_script.log"

echo "ApplicationStop script started." | tee -a $LOG_FILE

# Ensure Docker is running
sudo service docker start || {
    echo "Failed to start Docker service" | tee -a $LOG_FILE
    exit 1
}

# Stop the container if it exists
docker stop netflix 2>/dev/null || echo "Container 'netflix' is not running. Skipping stop." | tee -a $LOG_FILE

# Remove the container if it exists
docker rm netflix 2>/dev/null || echo "Container 'netflix' does not exist. Skipping removal." | tee -a $LOG_FILE

# Remove the Docker image if it exists
docker rmi boatengkwasi1991/netflix-react-app:latest 2>/dev/null || echo "Image 'boatengkwasi1991/netflix-react-app:latest' does not exist. Skipping image removal." | tee -a $LOG_FILE

echo "ApplicationStop script completed successfully." | tee -a $LOG_FILE
