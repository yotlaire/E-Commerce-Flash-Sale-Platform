output "lambda_bucket_name" {
  value = aws_s3_bucket.lambda_code.id
}

output "lambda_bucket_arn" {
  value = aws_s3_bucket.lambda_code.arn
}

output "content_bucket_name" {
  value = aws_s3_bucket.content.id
}

output "content_bucket_arn" {
  value = aws_s3_bucket.content.arn
}