#!/bin/bash
set -e

cd /opt/
sudo dnf install -y java-17-amazon-corretto unzip wget

sudo wget -q https://binaries.sonarsource.com/Distribution/sonarqube/sonarqube-8.9.6.50800.zip
sudo unzip -q sonarqube-8.9.6.50800.zip
sudo rm -f sonarqube-8.9.6.50800.zip

# Create sonar user if it doesn't already exist
if ! id -u sonar >/dev/null 2>&1; then
  sudo useradd -r -m -d /opt/sonarqube-8.9.6.50800 -s /bin/bash sonar
fi

sudo chown -R sonar:sonar /opt/sonarqube-8.9.6.50800
sudo chmod -R 755 /opt/sonarqube-8.9.6.50800
