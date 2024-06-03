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

RUN mkdir -p /srv/sonsofthedocker/
RUN mkdir -p /srv/sonsofthedocker/config
RUN mkdir -p /opt/scripts/sonsofthedocker/
ADD scripts /opt/scripts/sonsofthedocker/


# Install game
ADD cfg /srv/sonsofthedocker/config
WORKDIR /srv/sonsofthedocker

RUN 
RUN /opt/scripts/sonsofthedocker/install.sh
RUN mkdir -p /root/.wine/drive_c/users/root/AppData/LocalLow/Endnight/SonsOfTheForestDS
RUN ln -s /srv/sonsofthedocker/config/* /root/.wine/drive_c/users/root/AppData/LocalLow/Endnight/SonsOfTheForestDS

EXPOSE 8766 27016 9700
ENTRYPOINT ["bash", "/opt/scripts/sonsofthedocker/start.sh"]