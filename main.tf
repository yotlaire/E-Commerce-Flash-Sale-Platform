provider "aws" {
  region = var.region
}

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.0.0"
  name    = "my-vpc"
  cidr    = "10.0.0.0/16"
  azs     = ["us-east-1a", "us-east-1b"]
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24"]
  public_subnets  = ["10.0.101.0/24", "10.0.102.0/24"]
  enable_nat_gateway = true
  single_nat_gateway = true
  enable_vpn_gateway = false
  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}

module "security_groups" {
  source = "./security_groups"
  vpc_id = module.vpc.vpc_id
}

module "ec2_instances" {
  source                = "./ec2_instances"
  vpc_id                = module.vpc.vpc_id
  public_subnet_ids     = module.vpc.public_subnets
  ec2_security_group_id = module.security_groups.ec2_security_group_id
}

module "s3" {
  source  = "./s3"
  s3_name = var.content_bucket_name
}

module "lambda" {
  source              = "./lambda"
  s3_bucket_name      = module.s3.lambda_bucket_name
  product_table_arn   = module.dynamodb.product_table_arn
  inventory_table_arn = module.dynamodb.inventory_table_arn
}

module "rds" {
  source            = "./rds"
  vpc_id            = module.vpc.vpc_id
  security_group_id = module.security_groups.rds_security_group_id
  private_subnet_ids = module.vpc.private_subnets
}

module "dynamodb" {
  source = "./dynamodb"
}
#module "route53" {
# source = "./route53"
  
  #domain_name = var.domain_name
  #cloudfront_distribution_domain_name = module.cloudfront.distribution_domain_name
  #cloudfront_distribution_hosted_zone_id = module.cloudfront.distribution_hosted_zone_id
#}