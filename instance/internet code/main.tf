# # Configure the AWS Provider
# provider "aws" {
#   region = "us-east-1" # Modify as needed
# }

# Data source to get the latest Amazon Linux 2023 AMI
data "aws_ami" "amazon_linux_2023" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-*-kernel-6.1-x86_64"]
  }
}

# Create a Security Group for Jenkins
resource "aws_security_group" "jenkins_sg" {
  name_prefix = "jenkins-sg-"
  description = "Allow SSH and Jenkins port (8080) inbound traffic"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Restrict to your IP in production
  }

  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Launch the EC2 instance and use user_data for installation
resource "aws_instance" "jenkins_server" {
  ami           = data.aws_ami.amazon_linux_2023.id
  instance_type = "t2.medium" # t2.micro might be too small for Jenkins
  key_name      = "bhavani" # Name of your AWS key pair
  user_data     = file("install_jenkins.sh")
  vpc_security_group_ids = [aws_security_group.jenkins_sg.id]

  tags = {
    Name = "Jenkins-Server"
  }
}

# Output the public IP to easily access Jenkins after deployment
# output "jenkins_url" {
#   value = "http://${aws_instance.jenkins_server.public_ip}:8080"
# }

# output "initial_admin_password_cmd" {
#     value = "ssh -i jenkins-key.pem ec2-user@${aws_instance.jenkins_server.public_ip} 'sudo cat /var/lib/jenkins/secrets/initialAdminPassword'"
# }
