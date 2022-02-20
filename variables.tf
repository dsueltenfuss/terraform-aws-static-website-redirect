variable "source_website" {
  description = "The website that you are redirecting from"
}

variable "destination_website" {
  description = "The website that you are redirecting to"
}

variable "route_53_zone" {
  description = "The route 53 zone name for validating the certificate creation"
}