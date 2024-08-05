resource "aws_autoscaling_group" "my_asg" {
  availability_zones   = ["us-west-2a", "us-west-2b", "us-west-2c"]
  desired_capacity     = 2
  max_size             = 3
  min_size             = 1
  health_check_type    = "EC2"
  launch_configuration = aws_launch_configuration.my_lc.id

  tag {
    key                 = "Name"
    value               = "my-asg"
    propagate_at_launch = true
  }
}

resource "aws_autoscaling_policy" "scale_up" {
  name                   = "scale-up"
  scaling_adjustment     = 1
  adjustment_type        = "ChangeInCapacity"
  autoscaling_group_name = aws_autoscaling_group.my_asg.name
}

resource "aws_autoscaling_policy" "scale_down" {
  name                   = "scale-down"
  scaling_adjustment     = -1
  adjustment_type        = "ChangeInCapacity"
  autoscaling_group_name = aws_autoscaling_group.my_asg.name
}
