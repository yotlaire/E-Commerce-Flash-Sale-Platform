resource "aws_instance" "user_service" {
  ami           = "ami-0947d2ba12ee1ff75" # Use a valid AMI ID for your region
  instance_type = "t2.micro"
  subnet_id     = var.public_subnet_ids[0]
  vpc_security_group_ids = [var.ec2_security_group_id]
  tags = {
    Name = "user_service"
  }
}

resource "aws_instance" "order_service" {
  ami           = "ami-0947d2ba12ee1ff75" # Use a valid AMI ID for your region
  instance_type = "t2.micro"
  subnet_id     = var.public_subnet_ids[1]
  vpc_security_group_ids = [var.ec2_security_group_id]
  tags = {
    Name = "order_service"
  }
}