#!/bin/bash
set -e

# ============================================

# Jump Server User Data Script

# ============================================

# Change the server hostname

sudo hostnamectl set-hostname Jumper-Server-01

# Update the server

sudo apt update -y
sudo apt upgrade -y

# Create a directory for EFS

mkdir -p /home/ubuntu/webserver

# Install EFS client dependencies

sudo apt -y install nfs-common stunnel4 git binutils

# Add EFS mount configuration to fstab

sudo tee -a /etc/fstab > /dev/null <<EOF
fs-XXXXXXXX.efs.us-east-1.amazonaws.com:/ /home/ubuntu/webserver nfs4 nfsvers=4.1,rsize=1048576,wsize=1048576,hard,timeo=600,retrans=2,noresvport,_netdev 0 0
EOF

# Mount EFS

sudo mount -a

# ============================================

# Datadog Agent Installation

# ============================================

DD_API_KEY="<YOUR_DATADOG_API_KEY>" 
DD_SITE="datadoghq.com" 
DD_APM_INSTRUMENTATION_ENABLED=host 
DD_DATA_STREAMS_ENABLED=true 
DD_PROFILING_ENABLED=auto 
DD_ENV=dev 
DD_APM_INSTRUMENTATION_LIBRARIES=java:1,python:4,js:5,php:1,dotnet:3,ruby:2 
DD_LOGS_CONFIG_PROCESS_COLLECT_ALL=true 
bash -c "$(curl -L https://install.datadoghq.com/scripts/install_script_agent7.sh)"
