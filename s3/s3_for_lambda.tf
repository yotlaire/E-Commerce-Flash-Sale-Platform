resource "aws_s3_bucket" "lambda_code" {
  bucket = "lambda-code-storage-${random_id.lambda_code_suffix.hex}"

  tags = {
    Purpose = "Lambda Function Code Storage"
  }
}

resource "aws_s3_bucket_acl" "lambda_code" {
  bucket = aws_s3_bucket.lambda_code.id
  acl    = "private"
}

resource "random_id" "lambda_code_suffix" {
  byte_length = 8
}