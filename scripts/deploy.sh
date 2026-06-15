#!/bin/bash

APP_NAME=nodeapp

echo "Checking existing container..."

if [ "$(docker ps -aq -f name=$APP_NAME)" ]; then
    echo "Stopping old container..."
    docker stop $APP_NAME || true

    echo "Removing old container..."
    docker rm $APP_NAME || true
fi

echo "Checking existing image..."

if [ "$(docker images -q $APP_NAME)" ]; then
    echo "Removing old image..."
    docker rmi -f $APP_NAME || true
fi

echo "Building new image..."
docker build -t $APP_NAME .

echo "Starting new container..."
docker run -d \
--name $APP_NAME \
-p 5000:5000 \
$APP_NAME

echo "Deployment completed."
