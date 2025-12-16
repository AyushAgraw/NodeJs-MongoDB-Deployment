#!/bin/bash

apt update

# Install docker and trivy
apt install docker.io -y
curl -sfL https://raw.githubusercontent.com/aquasecurity/trivy/main/contrib/install.sh | sudo sh -s -- -b /usr/local/bin

git clone https://github.com/AyushAgraw/NodeJs-MongoDB-Deployment.git
cd NodeJs-MongoDB-Deployment

docker build -t  nodejs-deployment:v1 .
docker run -d -p 3000:3000 nodejs-deployment:v1