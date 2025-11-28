variable "ami_id" {
  description = "AMI ID for EC2 instances"
  default     = "ami-053b0d53c279acc90"  # Ubuntu 22.04 LTS in us-east-1
}

variable "instance_type" {
  description = "EC2 instance type"
  default     = "t2.micro"
}

variable "key_name" {
  description = "Name of the SSH key pair to use for EC2 instances"
  type        = string
}

variable "frontend_subnet_id" {
  description = "Subnet ID for frontend EC2 instance"
  type        = string
}

variable "backend_subnet_id" {
  description = "Subnet ID for backend EC2 instance"
  type        = string
}

variable "frontend_sg_id" {
  description = "Security Group ID for frontend EC2 instance"
  type        = string
}

variable "backend_sg_id" {
  description = "Security Group ID for backend EC2 instance"
  type        = string
}

