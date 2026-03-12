#!/bin/bash
dnf update -y
# Install Java 17 Amazon Corretto
yum install java-21-amazon-corretto -y
VALIDATE $? "jav"
# Add the Jenkins repository
#sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo
wget -O /etc/yum.repos.d/jenkins.repo \
        https://pkg.jenkins.io/redhat-stable/jenkins.repo
VALIDATE $? "wget"
# Import a key file from Jenkins-CI to enable installation from the package


rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key
VALIDATE $? "import "
# Install Jenkins
yum install jenkins -y
VALIDATE $? "install "
# Enable the Jenkins service to start at boot
systemctl enable jenkins
VALIDATE $? "enable "
# Start the Jenkins service
systemctl start jenkins
VALIDATE $? "starting "