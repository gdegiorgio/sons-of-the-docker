@echo off
set SONS_OF_THE_DOCKER_IMAGE_NAME=sons-of-the-docker
set SONS_OF_THE_DOCKER_CONTAINER_NAME=sons-of-the-docker



echo "Starting up your SOTF Server..."
echo "Building your docker image..."
CMD /c docker stop %SONS_OF_THE_DOCKER_CONTAINER_NAME%
CMD /c docker rm %SONS_OF_THE_DOCKER_CONTAINER_NAME%
CMD /c docker build . -t %SONS_OF_THE_DOCKER_IMAGE_NAME%
CMD /c docker tag %SONS_OF_THE_DOCKER_IMAGE_NAME% %SONS_OF_THE_DOCKER_IMAGE_NAME%:latest
CMD /c docker run -it -p 8766:8766/udp -p 27016:27016/udp -p 9700:9700/udp --network sons-of-the-docker-net --name %SONS_OF_THE_DOCKER_CONTAINER_NAME% %SONS_OF_THE_DOCKER_IMAGE_NAME% +quit