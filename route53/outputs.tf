output "route53_name_servers" {
  value       = aws_route53_zone.main.name_servers
  description = "Name servers for the Route 53 hosted zone"
  sensitive   = true
}
  output "zone_id" {
  value       = aws_route53_zone.main.zone_id
  description = "The Hosted Zone ID of the Route 53 zone"
}

output "name_servers" {
  value       = aws_route53_zone.main.name_servers
  description = "The name servers for the Route 53 zone"
}