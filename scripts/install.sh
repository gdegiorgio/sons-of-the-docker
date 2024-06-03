#!/bin/bash

install(){
  if [ -f "/srv/sons-of-the-docker/SonsOfTheForestDS.exe" ]; then
      echo "SonsOfTheForestDS is already installed"
  else
      echo "Installing SonsOfTheForestDS.."
      steamcmd  +@sSteamCmdForcePlatformType windows +force_install_dir /srv/sons-of-the-docker +login anonymous +app_update 2465200 validate +quit
  fi
  echo "Setting up wine"
  winecfg > /dev/null 2>&1
  sleep 15
  echo "Setting up xvfb"
  RUN Xvfb :1 -screen 0 1024x768x24 &
}
main(){
  install
}
main