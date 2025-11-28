resource "aws_s3_bucket" "static_site" {
  bucket = "${var.project_name}-static-${var.aws_region}"

  tags = {
    Name = "${var.project_name}-static"
  }
}