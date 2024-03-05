!#bin/sh

export SONS_OF_THE_DOCKER_IMAGE_NAME=sons-of-the-docker
export SONS_OF_THE_DOCKER_CONTAINER_NAME=sons-of-the-docker


echo "Starting up your SOTF Server..."
echo "Building your docker image..."
docker build . -t $SONS_OF_THE_DOCKER_IMAGE_NAME
docker tag SONS_OF_THE_DOCKER_IMAGE_NAME SONS_OF_THE_DOCKER_IMAGE_NAME:latest
docker run -d --name -p 8766:8766/udp -p 27016:27016/udp -p 9700:9700/udp $SONS_OF_THE_DOCKER_CONTAINER_NAME SONS_OF_THE_DOCKER_IMAGE_NAME +quit