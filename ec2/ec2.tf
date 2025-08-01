resource "aws_instance" "instance_creation" {
  ami                    = "ami-09c813fb71547fc4f"
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.my_sg.id]
  tags = {
    Name = "Terraform"
  }
}

resource "aws_security_group" "my_sg" {
  name        = "allow_ssh"
  description = "allow port number 22 for ssh access"
  #Usually we allow everything in egress
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"          #means all protocols
    cidr_blocks      = ["0.0.0.0/0"] #allowing all ports
    ipv6_cidr_blocks = ["::/0"]
  }

  ingress {
    from_port        = 22 #allow specific ports only -> 22 is for ssh
    to_port          = 22
    protocol         = "tcp"         #ssh is included in tcp protocol
    cidr_blocks      = ["0.0.0.0/0"] #allow from everyone
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "allow_ssh"
  }

}