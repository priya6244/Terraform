output "joindevops_ami" {
  value = data.aws_ami.joindevops_ami.image_id
}