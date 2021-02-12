#!/bin/bash
sudo apt update
sudo apt install -y ruby
sudo apt install -y wget
cd /home/ubuntu
wget https://aws-codedeploy-ap-south-1.s3.ap-south-1.amazonaws.com/latest/install -O install.sh
sudo chmod +x ./install.sh
sudo ./install.sh auto
sudo apt install -y python3-pip
sudo pip3 install awscli