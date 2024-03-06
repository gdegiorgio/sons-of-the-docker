FROM steamcmd/steamcmd:ubuntu
LABEL authors="Giovanni De Giorgio"


RUN useradd -ms /bin/bash steam
RUN mkdir -p /home/steam

RUN apt update && apt upgrade -y

# Install deps

RUN dpkg --add-architecture i386 && \
    mkdir -pm755 /etc/apt/keyrings && \
    apt install wget -y &&\
    apt install xvfb -y &&\
    apt install libatomic1 libpulse-dev libpulse0 -y

# Install wine

RUN wget -O /etc/apt/keyrings/winehq-archive.key https://dl.winehq.org/wine-builds/winehq.key
RUN wget -NP /etc/apt/sources.list.d/ https://dl.winehq.org/wine-builds/debian/dists/bookworm/winehq-bookworm.sources
RUN apt update
RUN apt install --assume-yes --install-recommends winehq-stable

ENV WINEARCH=win64

# Copy files

RUN mkdir -p /srv/sons-of-the-docker/
RUN mkdir -p /opt/scripts/sons-of-the-docker/
ADD scripts /opt/scripts/sons-of-the-docker/



#RUN wineboot -u


# Install game
ADD cfg /root/.wine/drive_c/users/root/AppData/LocalLow/Endnight/SonsOfTheForestDS
WORKDIR /srv/sons-of-the-docker



RUN /opt/scripts/sons-of-the-docker/install.sh

EXPOSE 8766 27016 9700
ENTRYPOINT ["bash", "/opt/scripts/sons-of-the-docker/start.sh"]