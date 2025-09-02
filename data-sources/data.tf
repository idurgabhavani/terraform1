data "aws_ami" "aws-linux-2" {


    owners           = ["111986023115"]
    most_recent      = true

    filter {
        name   = "name"
        values = ["amzn2-x86_64-SQL_2019_Standard-2025.04.16"]
        
    }

    filter {
        name   = "root-device-type"
        values = ["ebs"]
      
    }

    filter {
        name   = "virtualization-type"
        values = ["hvm"]

    }
}