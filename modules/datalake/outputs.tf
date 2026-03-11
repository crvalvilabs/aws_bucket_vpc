output "bucket_info" {
    description = "Información de los buckets de S3"
    value = {
        for bucket in aws_s3_bucket.bucket :
        bucket.bucket => {
        name = bucket.bucket
        region = bucket.region
        }
    }
}
