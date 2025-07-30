resource "aws_instance" "instance_terraform" {
  ami                    = var.ami_id #left side and right side need not to be same
  instance_type          = var.instance_type #if same also, no issue
  vpc_security_group_ids = [aws_security_group.my_sg.id]
  tags                   = var.tags
}

resource "aws_security_group" "my_sg" {
  name        = var.sg_name
  description = var.sg_description
  #Usually we allow everything in egress block
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  ingress {
    from_port        = var.from_port
    to_port          = var.to_port
    protocol         = var.protocal
    cidr_blocks      = var.ingress_cidr
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = var.sg_tags

}