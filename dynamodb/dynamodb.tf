resource "aws_dynamodb_table" "product_table" {
  name           = "ProductTable"
  billing_mode   = "PROVISIONED"
  hash_key       = "ProductID"
  range_key      = "Category"
  
  attribute {
    name = "ProductID"
    type = "S"
  }
  
  attribute {
    name = "Category"
    type = "S"
  }
  
  read_capacity  = 5
  write_capacity = 5
}

resource "aws_dynamodb_table" "inventory_table" {
  name           = "InventoryTable"
  billing_mode   = "PROVISIONED"
  hash_key       = "InventoryID"
  
  attribute {
    name = "InventoryID"
    type = "S"
  }
  
  read_capacity  = 5
  write_capacity = 5
}

output "product_table_arn" {
  value = aws_dynamodb_table.product_table.arn
}

output "inventory_table_arn" {
  value = aws_dynamodb_table.inventory_table.arn
}