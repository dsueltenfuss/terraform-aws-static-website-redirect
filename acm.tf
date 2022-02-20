resource "aws_acm_certificate" "certificate" {
  count             = local.create_resources ? 1 : 0
  domain_name       = var.source_website
  validation_method = "DNS"
  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_route53_record" "route_53_validation_record" {
  for_each = {
    for cert in aws_acm_certificate.certificate : cert.domain_name => {
      for_each = {
        for dvo in cert.domain_validation_options : dvo.domain_name => {
          name   = dvo.resource_record_name
          record = dvo.resource_record_value
          type   = dvo.resource_record_type
        }
      }
    }

  }


  allow_overwrite = true
  name            = each.value.value.name
  records         = [each.value.value.record]
  ttl             = 60
  type            = each.value.value.type
  zone_id         = data.aws_route53_zone.validation_zone.zone_id
}

resource "aws_acm_certificate_validation" "certificate_validation" {
  count                   = local.create_resources ? 1 : 0
  certificate_arn         = aws_acm_certificate.certificate[0].arn
  validation_record_fqdns = [for record in aws_route53_record.route_53_validation_record : record.fqdn]
}