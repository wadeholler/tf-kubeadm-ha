#!/usr/bin/env bash

if [ "$(. /etc/os-release; echo $NAME)" = "Ubuntu" ]; then
  apt-get update
  apt-get -y install python
  SSH_USER=ubuntu
fi
