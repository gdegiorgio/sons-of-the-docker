@echo off
set SONS_OF_THE_DOCKER_IMAGE_NAME=sons-of-the-docker
set SONS_OF_THE_DOCKER_CONTAINER_NAME=sons-of-the-docker



echo "Starting up your SOTF Server..."
echo "Building your docker image..."
CMD /c docker build . -t %SONS_OF_THE_DOCKER_IMAGE_NAME%
CMD /c docker tag %SONS_OF_THE_DOCKER_IMAGE_NAME% %SONS_OF_THE_DOCKER_IMAGE_NAME%:latest
CMD /c docker run -d --name %SONS_OF_THE_DOCKER_CONTAINER_NAME% %SONS_OF_THE_DOCKER_IMAGE_NAME%