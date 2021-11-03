#!/bin/bash
sudo mkdir -p /tmp/volatile && sudo chmod 777 /tmp/volatile
sudo modprobe snd-aloop
arecord -l | grep Loopback
if [[ ! -f ../player/vars/environment.sh ]];
then
    cp ../player/vars/environment.sh.dist ../player/vars/environment.sh
    echo "PLAYER ENVIRONMENT UNSET, COPIED FROM .dist; PLEASE REVIEW ENVIRONMENT CONFIGURATION and press <enter> to continue"
    read
fi
if [[ ! -f ../gui/vars/environment.sh ]];
then
    cp ../gui/vars/environment.sh.dist ../gui/vars/environment.sh
    echo "GUI ENVIRONMENT UNSET, COPIED FROM .dist; PLEASE REVIEW ENVIRONMENT CONFIGURATION and press <enter> to continue"
    read
fi

if [[ ! -f docker-compose.yml ]];
then
    cp docker-compose.yml.dist docker-compose.yml
    echo "DOCKER COMPOSE UNSET, COPIED FROM .dist; PLEASE REVIEW DOCKER COMPOSE CONFIGURATION and press <enter> to continue"
    read
fi

$(cd ../gui && ./install-deps.sh)
docker-compose up --build 