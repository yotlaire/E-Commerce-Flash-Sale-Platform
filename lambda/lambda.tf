resource "aws_lambda_function" "product_service" {
  function_name = "ProductService"
  s3_bucket     = var.s3_bucket_name
  s3_key        = "product_service.zip"
  handler       = "index.handler"
  runtime       = "nodejs18.x"
  role          = aws_iam_role.lambda_role.arn
}

resource "aws_lambda_function" "inventory_service" {
  function_name = "InventoryService"
  s3_bucket     = var.s3_bucket_name
  s3_key        = "inventory_service.zip"
  handler       = "index.handler"
  runtime       = "nodejs18.x"
  role          = aws_iam_role.lambda_role.arn
}

resource "aws_iam_role" "lambda_role" {
  name               = "LambdaExecutionRole"
  assume_role_policy = data.aws_iam_policy_document.lambda_assume_role_policy.json
}

data "aws_iam_policy_document" "lambda_assume_role_policy" {
  statement {
    actions = ["sts:AssumeRole"]
    principals {
      type        = "Service"
      identifiers = ["lambda.amazonaws.com"]
    }
  }
}

resource "aws_iam_policy" "lambda_dynamodb_access" {
  name   = "LambdaDynamoDBAccess"
  policy = data.aws_iam_policy_document.dynamodb_access.json
}

data "aws_iam_policy_document" "dynamodb_access" {
  statement {
    actions = ["dynamodb:GetItem", "dynamodb:PutItem"]
    resources = [
      var.product_table_arn,
      var.inventory_table_arn
    ]
  }
}

resource "aws_iam_role_policy_attachment" "lambda_dynamodb_attach" {
  role       = aws_iam_role.lambda_role.name
  policy_arn = aws_iam_policy.lambda_dynamodb_access.arn
}