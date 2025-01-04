variable "instances" {
  type        = map
  default     = {
    mysql = "t3.micro"
    frontend = "t2.micro"
    backend = "t2.micro"
  }
}

variable "zone_id" {
    default = "Z041715728LF1PXBKQNOM"
}

variable "domain_name" {
    default = "haridev.online"
}