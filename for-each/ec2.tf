resource "aws_instance" "expense" {
    for_each = var.instances #instances is map
    # for_each will give us a special variable with name each
    ami                     = "ami-09c813fb71547fc4f"
    instance_type           = each.value
    vpc_security_group_ids  = [aws_security_group.my_sg.id]
    tags = {
        Name = each.key
    }
}

resource "aws_security_group" "my_sg" {
    name = "allow_ssh"
    description = "allow port number 22 for ssh access"
    #Usually we allow everything in egress
    egress {
        from_port       = 0
        to_port         = 0
        protocol        = "-1"
        cidr_blocks      = ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"]    
    }

    ingress {
        from_port       = 22
        to_port         = 22
        protocol        = "tcp"
        cidr_blocks      = ["0.0.0.0/0"] #allow from everyone
        ipv6_cidr_blocks = ["::/0"]
    }

    tags = {
        Name = "allow_ssh"
    }

}