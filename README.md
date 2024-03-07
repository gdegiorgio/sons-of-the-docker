
>⚠️ **Warning: Still Under Development** ⚠️
> 🗺️ On the Roadmap: Providing volumes for data persistence and external configs mapping. Stay tuned for updates from the underworld!

# Sons of the Forest - Dedicated Server with Docker :skull:

Welcome to the world of Sons of the Docker! :ghost:

Prepare yourself for a chilling journey into the depths of containerization and beyond! :zombie:

## :fire: How to Run Sons of the Docker Server on Your PC

Follow these spine-chilling steps to summon the Sons of the Docker Server to your local machine:

### :computer: Prerequisites

Ensure you have the following ghastly tools installed on your machine:

- [Docker](https://www.docker.com/) - The gateway to the underworld of containers

### :zap: Pull the Image from Docker Hub

Open your terminal and unleash the dark magic with this command:

```bash
docker pull giovannidegiorgio/sons-of-the-docker:latest
```
:skull: Run the Server

Once the image is summoned, bring it to life with the following incantation:

```bash
docker run -d --name sons_of_the_docker -p 8766:8766/udp -p 27016:27016/udp -p 9700:9700/udp giovannidegiorgio/sons-of-the-docker:latest
```

### :eyes: Verify the Server is Running

Peek into the netherworld to ensure the server has risen from the depths:


``` bash
docker ps
```

You should see sons_of_the_docker_server among the undead containers.
:sparkles: Access the Server

Access now to Sons Of the Forest, you will see your Sons Of The Docker instance in the LAN server list!

### :warning: Disclaimer

Beware, brave soul, for delving into the dark arts of containerization may awaken ancient evils beyond your comprehension. Proceed with caution!

### :skull_and_crossbones: Contributing

If you dare to enhance the terror of Sons of the Docker Server, feel free to summon your darkest powers and contribute to this repository. We welcome your cursed pull requests and unholy issues.

Happy haunting! :smiling_imp: