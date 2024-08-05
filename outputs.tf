output "vpc_id" {
  value = module.vpc.vpc_id
}

output "public_subnet_ids" {
  value = module.vpc.public_subnets
}

output "private_subnet_ids" {
  value = module.vpc.private_subnets
}

output "ec2_security_group_id" {
  value = module.security_groups.ec2_security_group_id
}

output "lambda_security_group_id" {
  value = module.security_groups.lambda_security_group_id
}

output "rds_security_group_id" {
  value = module.security_groups.rds_security_group_id
}

output "product_table_arn" {
  value = module.dynamodb.product_table_arn
}

output "inventory_table_arn" {
  value = module.dynamodb.inventory_table_arn
}



output "lambda_bucket_name" {
  value = module.s3.lambda_bucket_name
}

output "lambda_bucket_arn" {
  value = module.s3.lambda_bucket_arn
}

output "content_bucket_name" {
  value = module.s3.content_bucket_name
}

output "content_bucket_arn" {
  value = module.s3.content_bucket_arn
}

