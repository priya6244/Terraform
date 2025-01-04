variable "instance_names" {
    type = list(string)
    default = ["mysql", "backend", "frontend"]
}

variable "common_tags" {
    type        = map
    default     = {
      Project = "expense"
      Environment = "Dev"
      Terraform = "true"  
  }
}

variable "zone_id" {
    default = "Z041715728LF1PXBKQNOM"
}

variable "domain_name" {
    default = "haridev.online"
}
