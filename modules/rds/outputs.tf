

output "address" {
  value = "${aws_db_instance.postgres.address}"
}

output "name" {
  value = "${aws_db_instance.postgres.db_name}"
}

output "endpoint" {
  value = "${aws_db_instance.postgres.endpoint}"
}

output "username" {
  value = "${aws_db_instance.postgres.username}"
}

output "allocated_storage" {
  value = "${aws_db_instance.postgres.allocated_storage}"
}

output "auto_minor_version_upgrade" {
  value = "${aws_db_instance.postgres.auto_minor_version_upgrade}"
}

output "availability_zone" {
  value = "${aws_db_instance.postgres.availability_zone}"
}

output "backup_retention_period" {
  value = "${aws_db_instance.postgres.backup_retention_period}"
}

output "db_cluster_identifier" {
  value = "${aws_db_instance.postgres.db_cluster_identifier}"
}

output "db_instance_arn" {
  value = "${aws_db_instance.postgres.db_instance_arn}"
}

output "db_instance_class" {
  value = "${aws_db_instance.postgres.db_instance_class}"
}

output "db_parameter_groups" {
  value = "${aws_db_instance.postgres.db_parameter_groups}"
}

output "db_security_groups" {
  value = "${aws_db_instance.postgres.db_security_groups}"
}

output "db_subnet_group" {
  value = "${aws_db_instance.postgres.db_subnet_group}"
}

output "db_instance_port" {
  value = "${aws_db_instance.postgres.db_instance_port}"
}

output "engine" {
  value = "${aws_db_instance.postgres.engine}"
}

output "engine_version" {
  value = "${aws_db_instance.postgres.engine_version}"
}

output "hosted_zone_id" {
  value = "${aws_db_instance.postgres.hosted_zone_id}"
}

output "iops" {
  value = "${aws_db_instance.postgres.iops}"
}

output "kms_key_id" {
  value = "${aws_db_instance.postgres.kms_key_id}"
}

output "license_model" {
  value = "${aws_db_instance.postgres.license_model}"
}

output "master_username" {
  value = "${aws_db_instance.postgres.master_username}"
}

output "monitoring_interval" {
  value = "${aws_db_instance.postgres.monitoring_interval}"
}

output "monitoring_role_arn" {
  value = "${aws_db_instance.postgres.monitoring_role_arn}"
}

output "multi_az" {
  value = "${aws_db_instance.postgres.multi_az}"
}

output "option_group_memberships" {
  value = "${aws_db_instance.postgres.option_group_memberships}"
}

output "port" {
  value = "${aws_db_instance.postgres.port}"
}

output "preferred_backup_window" {
  value = "${aws_db_instance.postgres.preferred_backup_window}"
}

output "preferred_maintenance_window" {
  value = "${aws_db_instance.postgres.preferred_maintenance_window}"
}

output "publicly_accessible" {
  value = "${aws_db_instance.postgres.publicly_accessible}"
}

output "storage_encrypted" {
  value = "${aws_db_instance.postgres.storage_encrypted}"
}

output "storage_type" {
  value = "${aws_db_instance.postgres.storage_type}"
}

output "timezone" {
  value = "${aws_db_instance.postgres.timezone}"
}

output "vpc_security_groups" {
  value = "${aws_db_instance.postgres.vpc_security_groups}"
}

output "replicate_source_db" {
  value = "${aws_db_instance.postgres.replicate_source_db}"
}

output "ca_cert_identifier" {
  value = "${aws_db_instance.postgres.ca_cert_identifier}"
}


