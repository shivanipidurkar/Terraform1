output "public_ip" {
    value = aws_instance.EC2.public_ip
    sensitive = true
  
}

output "private_ip" {
    value = aws_instance.EC2.private_ip
    sensitive = true
  
}