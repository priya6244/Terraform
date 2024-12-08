variable "instance_names" {
    type = list(string)
    default = ["mysqlll", "backend", "frontend"]
}

variable "common_tags" {
  type        = map
  default     = {
    Project = "expense"
    Environment = "Dev"
    Terraform = "true"  
  }
}
