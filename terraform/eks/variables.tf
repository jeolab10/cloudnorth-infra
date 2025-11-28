variable "project" {
  description = "Project name prefix"
  type        = string
  default     = "cloudnorth"
}

variable "aws_region" {
  description = "AWS region to deploy EKS"
  type        = string
  default     = "eu-west-1"
}

variable "cluster_name" {
  description = "Name of the EKS cluster"
  type        = string
  default     = "cloudnorth-eks"
}

variable "eks_version" {
  description = "Kubernetes version for EKS"
  type        = string
  default     = "1.32"
}

variable "private_subnet_ids" {
  description = "List of private subnet IDs where worker nodes will run"
  type        = list(string)

  # For now, you can hardcode from terraform/network outputs or AWS console
  # example:
  # default = ["subnet-1234567890abcdef0", "subnet-abcdef0123456789a"]
}

variable "node_instance_type" {
  description = "EC2 instance type for worker nodes"
  type        = string
  default     = "t3.medium"
}

variable "node_desired_size" {
  description = "Desired number of worker nodes"
  type        = number
  default     = 2
}

variable "node_min_size" {
  description = "Minimum number of worker nodes"
  type        = number
  default     = 1
}

variable "node_max_size" {
  description = "Maximum number of worker nodes"
  type        = number
  default     = 3
}