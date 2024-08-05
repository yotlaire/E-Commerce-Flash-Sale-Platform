resource "aws_s3_bucket" "content" {
  bucket = var.s3_name
}

resource "aws_s3_bucket_acl" "content" {
  bucket = aws_s3_bucket.content.id
  acl    = "private"
}

resource "aws_s3_bucket_website_configuration" "content" {
  bucket = aws_s3_bucket.content.bucket

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "index.html"
  }
}

resource "aws_s3_bucket_policy" "content" {
  bucket = aws_s3_bucket.content.id
  policy = jsonencode({
    Version = "2012-10-17"
    Id      = "AllowGetObjects"
    Statement = [
      {
        Sid       = "AllowPublic"
        Effect    = "Allow"
        Principal = "*"
        Action    = "s3:GetObject"
        Resource  = "${aws_s3_bucket.content.arn}/*"
      }
    ]
  })
}