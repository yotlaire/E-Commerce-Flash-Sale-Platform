
variable "domain_name" {
  type        = string
  description = "The domain name for the Route 53 hosted zone"
  default     = "example.com"
}
variable "cloudfront_distribution_domain_name" {
  description = "The domain name of the CloudFront distribution"
  type        = string
  default     = "www.example.com"
}

variable "cloudfront_distribution_hosted_zone_id" {
  description = "The hosted zone ID of the CloudFront distribution"
  type        = string
  default     = "Z2FDTNDATAQYW2" # This is a default value for an example
}