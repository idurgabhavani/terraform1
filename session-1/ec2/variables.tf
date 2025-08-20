variable "sg-name" {
    type = string
    default = "roboshop-all"
}

variable "sg-description" {
    type = string
    default = "Allow TLS inbound traffic and all outbound traffic"
}

variable "inbound-from-port" {
    #type = string
    default = 0
}

variable "cidr_blocks" {
    #type = string  >> in terraform there is no need to give the type of the variable . terrafom  automaticcaly understand the values
    type = list
    default = ["0.0.0.0/0"]
}