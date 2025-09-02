variable "ingress_rules" {

    
    default = [
        {
            description      = "Allow all port number 80"
            from_port        = 80# 0 means all ports
            to_port          = 80
            protocol         = "tcp"
            cidr_blocks      = ["0.0.0.0/0"]
        },
        {
            description      = "Allow all port number 443"
            from_port        = 443# 0 means all ports
            to_port          = 443
            protocol         = "tcp"
            cidr_blocks      = ["0.0.0.0/0"]
        # ipv6_cidr_blocks = ["::/0"]
        },
        {
            description      = "Allow all port number 22"
            from_port        = 22# 0 means all ports
            to_port          = 22
            protocol         = "tcp"
            cidr_blocks      = ["0.0.0.0/0"]
        },
        {
            description      = "Allow all port number 3306"
            from_port        = 3306# 0 means all ports
            to_port          = 3306
            protocol         = "tcp"
            cidr_blocks      = ["0.0.0.0/0"]
        }


    
    ]
}