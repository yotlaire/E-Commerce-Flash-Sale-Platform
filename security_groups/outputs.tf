output "ec2_security_group_id" {
  value = aws_security_group.ec2.id
}

output "lambda_security_group_id" {
  value = aws_security_group.lambda.id
}

output "rds_security_group_id" {
  value = aws_security_group.rds_sg.id
}