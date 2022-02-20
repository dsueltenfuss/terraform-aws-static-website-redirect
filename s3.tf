resource "aws_s3_bucket" "bucket" {
  bucket = var.source_website
}

resource "aws_s3_bucket_acl" "bucket_acl" {
  bucket = aws_s3_bucket.bucket.id
  acl    = "private"
}
resource "aws_s3_bucket_website_configuration" "bucket_redirect" {
  bucket = aws_s3_bucket.bucket.bucket
  redirect_all_requests_to {
    host_name = var.destination_website
    protocol  = "https"
  }
}