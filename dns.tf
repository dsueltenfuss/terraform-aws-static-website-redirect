resource "aws_route53_record" "source_dns" {
  count   = local.create_resources ? 1 : 0
  zone_id = data.aws_route53_zone.validation_zone.zone_id
  name    = var.source_website
  type    = "CNAME"
  ttl     = "60"
  records = [aws_cloudfront_distribution.cloudfront[0].domain_name]
}