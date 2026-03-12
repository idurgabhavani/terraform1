resource "aws_instance" "jenkins" {
    ami = "ami-02dfbd4ff395f2a1b"
    instance_type = "t3.small"
    key_name      = "bhavani"
    tags = {
    Name = "jenkins"  # this will be our instance name 
  }



connection {
  type     = "ssh"
  user     = "ec2-user"
  private_key = file("D:/DevOps/DurgaBhavani/newyear2025/durga.pem")
  #password = ""
  host     = self.public_ip
}

provisioner "remote-exec" {
    inline = [

      #"echo 'this is from remote exec' > /tmp/remote.txt",
      "sudo yum install git -y",
      
    ]
  }
}