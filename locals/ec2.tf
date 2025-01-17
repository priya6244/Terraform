resource "aws_instance" "expense" {
  count                  = length(var.instance_names)
  ami                    = data.aws_ami.joindevops_ami.id
  instance_type          = var.instance_names[count.index] == "mysql" ? "t3.micro" : "t2.micro"
  vpc_security_group_ids = [aws_security_group.my_sg.id]
  tags = {
    Name = var.instance_names[count.index]
  }
}

resource "aws_security_group" "my_sg" {
  name        = "allow_ssh"
  description = "allow port number 22 for ssh access"
  #Usually we allow everything in egress
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  ingress {
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"] #allow from everyone
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "allow_ssh"
  }

}


#if production, create t3.micro, otherwise t2.micro
resource "aws_instance" "elasticsearch" {
  ami                    = data.aws_ami.joindevops_ami.id
  instance_type          = local.instance_type
  vpc_security_group_ids = [aws_security_group.my_sg.id]
  tags = {
    Name = "Terraform"
  }
}