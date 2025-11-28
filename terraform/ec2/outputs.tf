output "frontend_ec2_id" {
  description = "ID of the frontend EC2 instance"
  value       = aws_instance.cloudnorth-frontend-ec2.id
}

output "backend_ec2_id" {
  description = "ID of the backend EC2 instance"
  value       = aws_instance.cloudnorth-backend-ec2.id
}

output "frontend_eip" {
  description = "Elastic IP of the frontend EC2 instance"
  value       = aws_eip.cloudnorth_frontend_eip.public_ip
}

output "backend_eip" {
  description = "Elastic IP of the backend EC2 instance"
  value       = aws_eip.cloudnorth_backend_eip.public_ip
}