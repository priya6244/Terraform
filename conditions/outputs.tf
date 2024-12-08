output "public_ip" {
  value       = aws_instance.instance_terraform.public_ip
  sensitive   = false
  description = "This is the public ip address of instance"
}
