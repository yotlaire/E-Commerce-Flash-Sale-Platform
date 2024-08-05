
resource "aws_cloudwatch_log_group" "lambda_log_group" {
  name              = "/aws/lambda/${aws_lambda_function.product_service.function_name}"
  retention_in_days = 14
}

resource "aws_cloudwatch_log_group" "api_gateway_log_group" {
  name              = "API-Gateway-Execution-Logs_${aws_api_gateway_rest_api.ecommerce_api.id}/prod"
  retention_in_days = 14
}

resource "aws_cloudwatch_log_group" "ec2_log_group" {
  name              = "/aws/ec2/user_service"
  retention_in_days = 14
}

resource "aws_cloudwatch_log_group" "rds_log_group" {
  name              = "/aws/rds/user_db"
  retention_in_days = 14
}

resource "aws_cloudwatch_metric_alarm" "high_cpu_alarm" {
  alarm_name          = "high_cpu_alarm"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = "2"
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = "120"
  statistic           = "Average"
  threshold           = "80"

  alarm_description = "This metric monitors high CPU utilization"
  alarm_actions     = [aws_sns_topic.alerts.arn]

  dimensions = {
    InstanceId = aws_instance.user_service.id
  }
}

resource "aws_sns_topic" "alerts" {
  name = "ecommerce-alerts"
}
