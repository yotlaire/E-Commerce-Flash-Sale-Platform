resource "aws_elasticache_cluster" "redis" {
  cluster_id           = "redis-cluster"
  engine               = "redis"
  node_type            = "cache.t2.micro"
  num_cache_nodes      = 1
  parameter_group_name = "default.redis3.2"
  port                 = 6379
  subnet_group_name    = aws_elasticache_subnet_group.default.name

  tags = {
    Name = "redis-cluster"
  }
}

resource "aws_elasticache_subnet_group" "default" {
  name       = "default"
  subnet_ids = module.vpc.private_subnet_ids

  tags = {
    Name = "default"
  }
}
