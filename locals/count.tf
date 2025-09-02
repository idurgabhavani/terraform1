resource "aws_instance" "web" {
  ami          = var.ami_id
  instance_type = local.instance_type
  tags = {

    Name = "locals"
  }
  
}


# resource "aws_instance" "web" {
#   #count = 4 # count.index is a special variable given by terraform
#   count = length(var.instance_name)
#   ami           =  var.ami_id #"ami-00ca32bbc84273381"
#   instance_type = local.instance_type

#   tags = {
#     Name = var.instance_name[count.index]
#   }
  
#   #vpc_security_group_ids = [aws_security_group.roboshop-all.id]  # this means list

#   #tags = var.tags
# }

# resource "aws_route53_record" "www" {
#   #count = 4
#   count = length(var.instance_name)
#   zone_id = var.zone_id
#   name    = "${var.instance_name[count.index]}.${var.domain_name}"
#   type    = "A"
#   ttl     = 1
#   records = [local.ip]
# }