resource "aws_s3_bucket" "bucket" {
  for_each = var.dev_infrastructure.bucket.name
  bucket = "${each.value.name}-dev"

  tags = {
    Name        = each.value.name
    Environment = var.dev_infrastructure.environment.name
  }
}