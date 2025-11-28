resource "aws_instance" "cloudnorth-frontend-ec2" {
  ami                    = var.ami_id
  instance_type          = var.instance_type   # <-- Updated to use variable
  key_name               = aws_key_pair.cloudnorth_key.key_name
  subnet_id              = var.frontend_subnet_id
  vpc_security_group_ids = [var.frontend_sg_id]
  associate_public_ip_address = false

  tags = {
    Name    = "cloudnorth-frontend-ec2"
    Project = "CloudNorth"
  }

  root_block_device {
    volume_size = 30
    volume_type = "gp3"
  }
}

resource "aws_eip" "cloudnorth_frontend_eip" {
  instance = aws_instance.cloudnorth-frontend-ec2.id
 
  tags = {
    Name = "cloudnorth-frontend-eip"
  }
}

resource "aws_instance" "cloudnorth-backend-ec2" {
  ami                         = var.ami_id
  instance_type               = var.instance_type
  key_name                    = aws_key_pair.cloudnorth_key.key_name
  subnet_id                   = var.backend_subnet_id
  associate_public_ip_address = false

  vpc_security_group_ids = [
    var.backend_sg_id,
  ]

  tags = {
    Name    = "cloudnorth-backend-ec2"
    Project = "CloudNorth"
  }

  root_block_device {
    volume_size = 30
    volume_type = "gp3"
  }
}

resource "aws_eip" "cloudnorth_backend_eip" {
  instance = aws_instance.cloudnorth-backend-ec2.id
  
  tags = {
    Name = "cloudnorth-backend-eip"
  }
}

resource "aws_key_pair" "cloudnorth_key" {
  key_name   = "cloudnorth-key"
  public_key = file("${path.module}/../../keys/cloudnorth-key.pub") # Corrected path!
}