#!/bin/bash

# Pull the latest Docker image
docker pull boatengkwasi1991/netflix-react-app:latest || {
    echo "Failed to pull Docker image. Exiting."
    exit 1
}

# Run the container
docker run -d --name=netflix -p 8080:80 boatengkwasi1991/netflix-react-app:latest || {
    echo "Failed to start Docker container. Exiting."
    exit 1
}

echo "Docker container started successfully."
