#!/bin/bash

# Stop the container if it exists
docker stop netflix 2>/dev/null || echo "Container 'netflix' is not running. Skipping stop."

# Remove the container if it exists
docker rm netflix 2>/dev/null || echo "Container 'netflix' does not exist. Skipping removal."

# Remove the Docker image if it exists
docker rmi boatengkwasi1991/netflix-react-app:latest 2>/dev/null || echo "Image 'boatengkwasi1991/netflix-react-app:latest' does not exist. Skipping image removal."

echo "Cleanup completed."
