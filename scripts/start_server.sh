winecfg > /dev/null 2>&1
sleep 15
xvfb-run wine64 /srv/sons-of-the-docker/SonsOfTheForestDS.exe
top -b
