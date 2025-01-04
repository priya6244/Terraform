variable "ingress_rules" {
  default     = [
        {
            from_port       = 80
            to_port         = 80
            protocol        = "tcp"
            cidr_blocks      = ["0.0.0.0/0"]
        },
        {
            from_port       = 8080
            to_port         = 8080
            protocol        = "tcp"
            cidr_blocks      = ["0.0.0.0/0"]
        }
    ]
}