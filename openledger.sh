#!/bin/bash

# Remove existing Docker versions
sudo apt remove -y docker docker-engine docker.io containerd runc

# Install dependencies for Docker
sudo apt install -y apt-transport-https ca-certificates curl software-properties-common

# Add Docker GPG key and repository
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Update and install Docker
sudo apt update
sudo apt install -y docker-ce docker-ce-cli containerd.io

# Verify Docker installation
sudo docker --version

# Install dependencies for OpenLedger Node
sudo apt install -y libgtk-3-0 libnotify4 libnss3 libxss1 libxtst6 xdg-utils libatspi2.0-0 libsecret-1-0
sudo apt install unzip
sudo apt install screen
sudo apt-get install libgtk2.0-0t64 libgtk-3-0t64 libgbm1 libgbm-dev libnotify-dev libnss3 libxss1 libasound2t64 libxtst6 xauth xvfb
sudo apt-get install desktop-file-utils

# Download and install OpenLedger Node
wget https://cdn.openledger.xyz/openledger-node-1.0.0-linux.zip
unzip openledger-node-1.0.0-linux.zip
sudo dpkg -i openledger-node-1.0.0.deb

# Fix dependencies
sudo apt-get install -f
sudo dpkg --configure -a
