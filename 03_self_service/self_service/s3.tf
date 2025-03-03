resource "aws_s3_bucket" "self_service" {
    for_each = buckets
    bucket = each.bucket_name
}