variable "ami_id" {
    type = string
    default = "ami-00ca32bbc84273381"
}

variable "instance_type" {

    type = string
    default = "t2.micro"
  
}

variable "tags" {

    type = map
    default = {
        Name = "one"
        Project = "roboshop"
        Environment = "DEV"
        component = "Web"
        Terraform = "true"
    }
  
}

variable "sg-name" {

    type = string
    default = "roboshop-all"

}

variable "sg-description" {

    type = string
    default = "Allow TLS inbound traffic and all outbound traffic" 
}

variable "inbound-from-port" {

    type = string
    default = 0

}

variable "cidr_blocksye" {

    type = list
    default = ["0.0.0.0/0"]
}