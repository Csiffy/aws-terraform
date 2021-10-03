
resource "aws_rds_cluster_instance" "this" {
  provider           = aws.current
  count              = 1
  identifier         = "aurora-cluster-${count.index}"
  cluster_identifier = "${aws_rds_cluster.this.id}"
  instance_class     = "db.t2.micro"
}

resource "aws_rds_cluster" "this" {
  provider           = aws.current
  cluster_identifier = "aurora-cluster"
  availability_zones = ["eu-west-1a", "eu-west-1b"]
  database_name      = "database"
  master_username    = "username"
  master_password    = "password"
}


