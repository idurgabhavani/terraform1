variable "instance_name" {
    type = map
    default = {
        mongodb = "t3.small"
        redis = "t2.micro"
        mysql = "t3.small"
        rabbitmq = "t2.small"
        #cart = "t2.samll"
        #catalogue = "t3.small"
        #user = "t2.micro"
        #dispatch = "t2.micro"

    }
}

variable "ami_id" {
    type = string
    default = "ami-00ca32bbc84273381"
}

variable "zone_id"{
    
    default = "fhinsnian"
}

variable "domain_name" {

    default = "banuteja.online"
}