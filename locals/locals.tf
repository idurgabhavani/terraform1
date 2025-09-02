# locals {
#     name = "durga bhavani"
#     tranining = "AWS"
#     instance_type = var.instance_name[count.index] == "mongodb" || var.instance_name[count.index] == "catalogue" || var.instance_name[count.index] == "mysql" ? "t3.small" : "t2.micro"
#     ip = var.instance_name[count.index] == "web" ? aws_instance.web[count.index].public_ip : aws_instance.web[count.index].private_ip
# }

locals {

    instance_type = var.isProd ? "t3.small" : "t2.micro"
}
