locals {
  zone_id     = "Z041715728LF1PXBKQNOM"
  domain_name = "haridev.online"
  # count.index will not work in locals
  instance_type = var.environment == "production" ? "t3.micro" : "t2.micro"
}

