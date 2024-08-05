resource "aws_db_instance" "my_rds" {
  instance_class      = "db.t2.micro"
  engine              = "mysql"
  engine_version      = "5.7"
  allocated_storage   = 20
  storage_type        = "gp2"
  db_name             = "mydatabase"
  username            = "dbuser"
  password            = "dbpassword"
  skip_final_snapshot = true
  vpc_security_group_ids = [var.security_group_id]
  db_subnet_group_name = aws_db_subnet_group.my_db_subnet_group.name
}

resource "aws_db_subnet_group" "my_db_subnet_group" {
  name       = "my-db-subnet-group"
  subnet_ids = var.private_subnet_ids

  tags = {
    Name = "My DB subnet group"
  }
}
