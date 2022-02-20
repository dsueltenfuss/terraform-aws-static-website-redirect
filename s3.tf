resource "aws_s3_bucket" "bucket" {
  count  = local.create_resources ? 1 : 0
  bucket = var.source_website
}

resource "aws_s3_bucket_acl" "bucket_acl" {
  count  = local.create_resources ? 1 : 0
  bucket = aws_s3_bucket.bucket[0].id
  acl    = "private"
}
resource "aws_s3_bucket_website_configuration" "bucket_redirect" {
  count  = local.create_resources ? 1 : 0
  bucket = aws_s3_bucket.bucket[0].bucket
  redirect_all_requests_to {
    host_name = var.destination_website
    protocol  = "https"
  }
}