
resource "aws_db_instance" "postgres" {
  provider             = "aws.current"
  allocated_storage    = 20
  storage_type         = "gp2"
  storage_encrypted    = false
  engine               = "postgres"
  engine_version       = "9.6.3"
  instance_class       = "${var.instance_class}"
  name                 = "${var.dbname}"
  username             = "${var.username}"
  password             = "${var.password}"
  backup_retention_period = 7
  port                 = 5432
  license_model        = "postgresql-license"
  backup_window        = "23:00-23:30"
  maintenance_window   = "tue:23:38-wed:00:08"  
  publicly_accessible  = true
  db_subnet_group_name = "${aws_db_subnet_group.default.name}"
  skip_final_snapshot  = "${var.skip_final_snapshot}"
#  vpc_security_group_ids = ["${aws_db_security_group.default.id}"]
#  parameter_group_name = "${aws_db_parameter_group.default.name}"
  tags {
    description = "My DB subnet group"
    Name        = "Random-RDS"
  }
}

/*
resource "aws_db_parameter_group" "default" {
  provider = "aws.current"
  name     = "rds-pg"
  family   = "postgres96"

  parameter {
    name   = "character_set_server"
    value  = "utf8"
  }

  parameter {
    name   = "character_set_client"
    value  = "utf8"
  }
}

resource "aws_db_security_group" "default" {
  provider = "aws.current"
  name     = "rds_sg"

  ingress {
    cidr   = "10.0.0.0/24"
  }
}
*/

resource "aws_db_subnet_group" "default" {
  provider   = "aws.current"
  name       = "db-subnet-group"
  subnet_ids = ["${var.private_subnets}"]

  tags {
    description = "My DB subnet group"
  }
}


