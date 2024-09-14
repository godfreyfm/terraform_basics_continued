#!/bin/bash
set -ex
apt update -y
apt install -y docker.io
systemctl enable docker
systemctl start docker

# Add ubuntu user to docker group for future sessions
usermod -aG docker ubuntu

# Pull and run Nginx container - running detached 
docker run -d -p 8080:80 nginx

# Redirect logs for debugging 
apt update -y >> /var/log/user_data.log 2>&1
apt install -y docker.io >> /var/log/user_data.log 2>&1
systemctl enable docker >> /var/log/user_data.log 2>&1
systemctl start docker >> /var/log/user_data.log 2>&1
usermod -aG docker ubuntu >> /var/log/user_data.log 2>&1
docker run -d -p 8080:80 nginx >> /var/log/user_data.log 2>&1
