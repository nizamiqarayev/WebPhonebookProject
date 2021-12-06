#!/usr/bin/env bash

sudo yum update -y
sudo amazon-linux-extras install docker
sudo yum install docker
sudo service docker start
sudo usermod -a -G docker ec2-user
sudo yum install git -y
sudo mkdir -p /src/my-app
cd /src/my-app 
sudo docker run --net bridge -e SPRING_DATASOURCE_URL="" -e SPRING_DATASOURCE_USERNAME="" -e SPRING_DATASOURCE_PASSWORD="" --name serverpb -p 8080:8080 niz242001/pbbackend
sudo docker run --net bridge --name frontend -p 80:3000 niz242001/pbfrontend
