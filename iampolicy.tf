resource "aws_iam_policy" "lambda_s3_access" {
  name        = "LambdaS3AccessPolicy"
  description = "Allows Lambda functions to access S3 bucket objects"
  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow",
        Action = [
          "s3:GetObject",
          "s3:PutObject",
          "s3:ListBucket"
        ],
        Resource = [
          "${module.s3.content_bucket_arn}",
          "${module.s3.content_bucket_arn}/*",
          "${module.s3.lambda_bucket_arn}",
          "${module.s3.lambda_bucket_arn}/*"
        ]
      }
    ]
  })
}