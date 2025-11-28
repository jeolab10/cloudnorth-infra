terraform {
  required_version = ">= 1.6.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

# -------------------------------
# VPC
# -------------------------------
resource "aws_vpc" "cloudnorth" {
  cidr_block           = var.vpc_cidr
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "${var.project}-vpc"
  }
}

# -------------------------------
# PUBLIC SUBNET
# -------------------------------
resource "aws_subnet" "public_1" {
  vpc_id                  = aws_vpc.cloudnorth.id
  cidr_block              = var.public_subnet_cidr
  map_public_ip_on_launch = true
  availability_zone       = "${var.aws_region}a"

  tags = {
    Name = "${var.project}-public-1"
  }
}

# -------------------------------
# PRIVATE SUBNET
# -------------------------------
resource "aws_subnet" "private_1" {
  vpc_id            = aws_vpc.cloudnorth.id
  cidr_block        = var.private_subnet_cidr
  availability_zone = "${var.aws_region}a"

  tags = {
    Name = "${var.project}-private-1"
  }
}

# -------------------------------
# INTERNET GATEWAY
# -------------------------------
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.cloudnorth.id

  tags = {
    Name = "${var.project}-igw"
  }
}

# -------------------------------
# PUBLIC ROUTE TABLE
# -------------------------------
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.cloudnorth.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "${var.project}-public-rt"
  }
}

resource "aws_route_table_association" "public_assoc" {
  subnet_id      = aws_subnet.public_1.id
  route_table_id = aws_route_table.public.id
}
