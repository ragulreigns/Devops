#!/bin/bash

echo "Building the Docker image..."
docker-compose build

echo "Build complete!"

docker login -u ragul11 -p Ragul@docker2

# Build the Docker image
docker build -t ragul11/dev-react-app:latest .

# Tag and push the image to the dev repository
docker tag web ragul11/dev-react-app:latest ragul11/dev-react-app:latest
docker push ragul11/dev-react-app:latest
