output "vpc_id" {
  value = aws_vpc.cloudnorth.id
}

output "public_subnet_id" {
  value = aws_subnet.public_1.id
}

output "private_subnet_id" {
  value = aws_subnet.private_1.id
}

output "internet_gateway_id" {
  value = aws_internet_gateway.igw.id
}