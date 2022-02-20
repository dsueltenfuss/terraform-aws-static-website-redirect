resource "aws_route53_record" "source_dns" {
  zone_id = data.aws_route53_zone.validation_zone.zone_id
  name    = var.source_website
  type    = "CNAME"
  ttl     = "60"
  records = [aws_cloudfront_distribution.cloudfront.domain_name]
}