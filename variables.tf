variable "source_website" {
  description = "The website that you are redirecting from"
}

variable "destination_website" {
  description = "The website that you are redirecting to"
}

variable "route_53_zone" {
  description = "The route 53 zone name for validating the certificate creation"
}

variable "workspaces" {
  description = "Used when using multiple workspaces and only creating the resources for specific ones"
  type        = list(any)
  default     = []
}

variable "dns_ttl" {
  description = "The TTL for the created DNS records. Defaults to 60 seconds"
  default     = 60
}