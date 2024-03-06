#!/bin/bash

start(){
  xvfb-run -e /dev/stdout wine64 /srv/sons-of-the-docker/SonsOfTheForestDS.exe
}

update(){
  echo "Updating Server..."
  steamcmd +@sSteamCmdForcePlatformType windows +login anonymous +app_update 2465200 validate +quit
}

main(){
    if [[ "${UPDATE_ON_START,,}" == "true" ]]; then
        update
    fi
    start
}

main