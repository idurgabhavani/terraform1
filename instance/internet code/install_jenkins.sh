#!/bin/bash
sudo dnf update -y
# Install Java 17 Amazon Corretto
sudo dnf install java-17-amazon-corretto -y
# Add the Jenkins repository
sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo
# Import a key file from Jenkins-CI to enable installation from the package
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key
# Install Jenkins
sudo dnf install jenkins -y
# Enable the Jenkins service to start at boot
sudo systemctl enable jenkins
# Start the Jenkins service
sudo systemctl start jenkins
