resource "aws_instance" "web" {
  #count = 4 # count.index is a special variable given by terraform
  count = length(var.instance_name)
  ami           =  var.ami_id #"ami-00ca32bbc84273381"
  instance_type =  var.instance_name[count.index] == "mongodb" || var.instance_name[count.index] == "catalogue" || var.instance_name[count.index] == "mysql" ? "t3.small" : "t2.micro"

  tags = {
    Name = var.instance_name[count.index]
  }
  
  #vpc_security_group_ids = [aws_security_group.roboshop-all.id]  # this means list

  #tags = var.tags
}

resource "aws_route53_record" "www" {
  #count = 4
  count = length(var.instance_name)
  zone_id = var.zone_id
  name    = "${var.instance_name[count.index]}.${var.domain_name}"
  type    = "A"
  ttl     = 1
  records = [var.instance_name[count.index] == "web" ? aws_instance.web[count.index].public_ip : aws_instance.web[count.index].private_ip]
}