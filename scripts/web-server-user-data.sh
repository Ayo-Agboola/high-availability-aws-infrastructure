#!/bin/bash
set -e

# ============================================

# Web Server User Data Script

# ============================================

# Set the server hostname

sudo hostnamectl set-hostname WebServer-$(hostname -I | awk '{print $1}')

# Update the server

sudo apt update -y
sudo apt upgrade -y

# Install Nginx

sudo apt install -y nginx

# Enable and start Nginx

sudo systemctl enable nginx
sudo systemctl start nginx

# Remove the default Nginx website files

sudo rm -rf /var/www/html/*

# Install EFS client dependencies

sudo apt -y install nfs-common stunnel4 git binutils

# Add EFS mount configuration to fstab

sudo tee -a /etc/fstab > /dev/null <<EOF
fs-XXXXXXXX.efs.us-east-1.amazonaws.com:/ /var/www/html nfs4 nfsvers=4.1,rsize=1048576,wsize=1048576,hard,timeo=600,retrans=2,noresvport,_netdev 0 0
EOF

# Mount EFS

sudo mount -a

# Set ownership of the web directory

sudo chown -R www-data:www-data /var/www/html

# ============================================

# Datadog Agent Installation

# ============================================

DD_API_KEY="<YOUR_DATADOG_API_KEY>" 
DD_APP_KEY="<YOUR_DATADOG_APP_KEY>" 
DD_SITE="datadoghq.com" 
DD_APM_INSTRUMENTATION_ENABLED=host 
DD_APM_INSTRUMENTATION_LIBRARIES=java:1,python:4,js:5,php:1,dotnet:3,ruby:2 
DD_APPSEC_ENABLED=true 
DD_IAST_ENABLED=true 
DD_APPSEC_SCA_ENABLED=true 
DD_RUNTIME_SECURITY_CONFIG_ENABLED=true 
DD_COMPLIANCE_CONFIG_ENABLED=true 
DD_SBOM_CONTAINER_IMAGE_ENABLED=true 
DD_SBOM_HOST_ENABLED=true 
DD_DATA_STREAMS_ENABLED=true 
DD_PROFILING_ENABLED=auto 
DD_ENV=prod 
DD_OTELCOLLECTOR_ENABLED=true 
DD_RUM_ENABLED=true 
DD_RUM_APPLICATION_ID="<YOUR_RUM_APPLICATION_ID>" 
DD_RUM_CLIENT_TOKEN="<YOUR_RUM_CLIENT_TOKEN>" 
DD_RUM_REMOTE_CONFIGURATION_ID="<YOUR_RUM_REMOTE_CONFIGURATION_ID>" 
DD_RUM_SITE="datadoghq.com" 
DD_PRIVATE_ACTION_RUNNER_ENABLED=true 
DD_PRIVATE_ACTION_RUNNER_ACTIONS_ALLOWLIST=com.datadoghq.script.runPredefinedScript 
bash -c "$(curl -L https://install.datadoghq.com/scripts/install_script_agent7.sh)"
