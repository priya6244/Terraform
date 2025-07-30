# 1. command line
# 2. terraform.tfvars
# 3. environment variables, TF_VAR_your_variable_name
# 4. default
# 5. prompt
variable "ami_id" {
  type        = string
  default     = "ami-09c813fb71547fc4f"
  description = "This is the AMI id of the Rhel-9 DevOps practice"
}

variable "instance_type" {
  type        = string
  default     = "t2.micro"
  description = "This is the instance type"
}

#tags is always map type
variable "tags" {
  type = map #optional
  default = {
    Name        = "Backend"
    Project     = "expense"
    Component   = "backend"
    Environment = "DEV"
    Terraform   = "true" #created through terraform
  }
}

variable "sg_name" {
  default = "allow_ssh"
}

variable "sg_description" {
  default = "allow port number 22 for ssh access"
}

variable "from_port" {
  type    = number
  default = 22
}

variable "to_port" {
  type    = number
  default = 22
}

variable "protocal" {
  default = "tcp"
}

variable "ingress_cidr" {
  type    = list(string)
  default = ["0.0.0.0/0"]
}

variable "sg_tags" {
  default = {
    Name = "allow_ssh"
  }
}