terraform {
  required_providers {
    aws = {
        source = "hashicorp/aws"
      version = "6.12.0"
    }
  }
}
provider "aws" {
  region = 
  profile = "default"
}
resource "aws_s3_bucket" "success_terra" {
    bucket = "joseph_s3"
}
resource "aws_s3_bucket_public_access_block" "success_terra" {
bucket = "joseph_s3"
block_public_acls = true
}