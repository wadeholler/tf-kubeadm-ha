#!/usr/bin/env bash

if [ "$(. /etc/os-release; echo $NAME)" = "Ubuntu" ]; then
  apt-get update
  apt-get -y install python
  apt-get -y install python-pip
  pip install ansible
  SSH_USER=ubuntu
fi
