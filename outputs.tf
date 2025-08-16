output "instance-id" {
  value = aws_instance.module-vm.id
}

output "privat" {
  value = aws_instance.module-vm.private_ip
}

output "security" {
  value = aws_security_group.sg-vm.id
}