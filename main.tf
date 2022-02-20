data "aws_route53_zone" "validation_zone" {
  name         = var.route_53_zone
  private_zone = false
}

locals {
  create_resources = length(var.workspaces) > 0 ? contains(var.workspaces, terraform.workspace) : true
}
