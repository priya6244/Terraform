resource "aws_instance" "instance_terraform" {
    ami                     = "ami-09c813fb71547fc4f"
    instance_type           = "t2.micro"
    vpc_security_group_ids  = [aws_security_group.my_sg.id]
    tags = {
        Name = "Terraform"
    }
    # In this case my laptop is local
    provisioner "local-exec" {
        command = "echo ${self.public_ip} > public_ip.text"
    }
    connection {
            type     = "ssh"
            user     = "ec2-user"
            password = "DevOps321"
            host     = self.public_ip
        }
        
        # provisioners will execute at the time of creation
        provisioner "remote-exec" {
            inline = [
                "sudo dnf install ansible -y",
                "sudo dnf install nginx -y",
                "sudo systemctl start nginx",
            ]
        }

        provisioner "remote-exec" {
            when    = destroy
            inline = [
                "sudo systemctl stop nginx",
            ]
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