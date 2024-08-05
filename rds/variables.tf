variable "vpc_id" {
  description = "The VPC ID where resources will be created"
  type        = string
  default     = "vpc-0123abcd"  # Provide a valid default VPC ID
}



variable "ec2_security_group_id" {
  description = "Security group ID for EC2 instances"
  type        = string
  default     = "sg-123456"  # Provide a valid default security group ID
}

variable "security_group_id" {
  description = "The ID of the security group associated with the RDS instance"
  type        = string
  default     = null
}
variable "private_subnet_ids" {
  description = "List of private subnet IDs"
  type        = list(string)
}
