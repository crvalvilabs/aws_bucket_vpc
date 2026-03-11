resource "aws_s3_bucket" "bucket" {

  for_each = {
    for bucket in var.dev_infrastructure.bucket:
        bucket.name => bucket
  }

  bucket = "${each.value.name}-dev"

  tags = {
    Name        = each.value.name
    Environment = var.dev_infrastructure.environment.name
  }
}