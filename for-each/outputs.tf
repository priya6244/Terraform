output "expense" {
  value       = aws_instance.expense
  description = "Output of expense instance. We use this output to create route 53 records"
}