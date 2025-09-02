variable "instance_name" {
    type = list
    default = ["mongodb","redis","mysql","rabbitmq"]#"catalogur","user","cart","shipping","payment","dispatch","web"]

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