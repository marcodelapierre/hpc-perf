#!/bin/bash

sudo apt install -y ubuntu-dbgsym-keyring

echo "deb http://ddebs.ubuntu.com $(lsb_release -cs) main restricted universe multiverse
deb http://ddebs.ubuntu.com $(lsb_release -cs)-updates main restricted universe multiverse
deb http://ddebs.ubuntu.com $(lsb_release -cs)-proposed main restricted universe multiverse" | \
  sudo tee -a /etc/apt/sources.list.d/ddebs.list

sudo apt -y update

sudo apt install -y linux-image-`uname -r`-dbgsym
