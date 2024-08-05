variable "s3_bucket_name" {
  type = string
  default     = "default-bucket-name"
}

variable "product_table_arn" {
  type = string
}

variable "inventory_table_arn" {
  type = string
}