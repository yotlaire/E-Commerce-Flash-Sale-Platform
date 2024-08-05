variable "vpc_id" {
  description = "The VPC ID where resources will be created"
  type        = string
  default     = "vpc-0123abcd"  # Provide a valid default VPC ID
}

variable "public_subnet_ids" {
  description = "List of public subnet IDs"
  type        = list(string)
  default     = ["10.0.101.0/24", "10.0.102.0/24"]  # Provide a valid default list of subnet IDs
}

variable "ec2_security_group_id" {
  description = "Security group ID for EC2 instances"
  type        = string
  default     = "sg-123456"  # Provide a valid default security group ID
}
