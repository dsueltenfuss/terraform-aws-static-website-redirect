resource "aws_acm_certificate" "certificate" {
  count             = local.create_resources ? 1 : 0
  domain_name       = var.source_website
  validation_method = "DNS"
  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_route53_record" "route_53_validation_record" {
  count           = local.create_resources ? length(aws_acm_certificate.certificate[0].domain_validation_options) : 0
  allow_overwrite = true
  name            = tolist(aws_acm_certificate.certificate[0].domain_validation_options)[count.index].resource_record_name
  records         = [tolist(aws_acm_certificate.certificate[0].domain_validation_options)[count.index].resource_record_value]
  ttl             = 60
  type            = tolist(aws_acm_certificate.certificate[0].domain_validation_options)[count.index].resource_record_type
  zone_id         = data.aws_route53_zone.validation_zone.zone_id
}

resource "aws_acm_certificate_validation" "certificate_validation" {
  count                   = local.create_resources ? 1 : 0
  certificate_arn         = aws_acm_certificate.certificate[0].arn
  validation_record_fqdns = [for record in aws_route53_record.route_53_validation_record : record.fqdn]
}