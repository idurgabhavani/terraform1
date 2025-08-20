resource "aws_instance" "web" {
  ami           = "ami-00ca32bbc84273381"
  instance_type = "t2.micro"
  vpc_security_group_ids = [aws_security_group.roboshop-all.id]  # this means list

  tags = {
    Name = "Helloterraform"  # this will be our instance name 
  }
}

resource "aws_security_group" "roboshop-all" { #this is terraform name,for terraform reference onnly
    name        = var.sg-name # this is aws name
    description = var.sg-description
    #vpc_id      = aws_vpc.main.id


    ingress {
        description      = "Allow all ports"
        from_port        = var.inbound-from-port # 0 means all ports
        to_port          = 0
        protocol         = "tcp"
        cidr_blocks      = var.cidr_blocks
       # ipv6_cidr_blocks = ["::/0"]
    }

    egress {
        from_port        = 0
        to_port          = 0
        protocol         = "-1"
        cidr_blocks      = ["0.0.0.0/0"]
        #ipv6_cidr_blocks = ["::/0"]
    }

    tags = {

        Name = "roboshop-all"
    }



}