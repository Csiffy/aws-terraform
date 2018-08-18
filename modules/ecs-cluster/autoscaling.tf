
resource "aws_autoscaling_group" "ecs_cluster_instances" {
  provider = "aws.current"
  name     = "${var.name}"
  min_size = "${var.size}"
  max_size = "${var.size}"
  launch_configuration = "${aws_launch_configuration.ecs_instance.name}"
  vpc_zone_identifier  = ["${var.subnet_ids}"]
  #desired_capacity    = "${var.autoscale_desired}"
  #health_check_type   = "EC2"

  tag {
    key   = "Name"
    value = "${var.name}"
    propagate_at_launch = true
  }
}

# Fetch the AWS ECS Optimized Linux AMI.
data "aws_ami" "ecs" {
  provider = "aws.current"
  most_recent = true
  owners = ["amazon"]
  filter {
    name = "name"
    values = ["amzn-ami-*-amazon-ecs-optimized"]
  }
}

# The launch configuration for each EC2 Instance that will run in the ECS Cluster
resource "aws_launch_configuration" "ecs_instance" {
  provider = "aws.current"
  name_prefix   = "${var.name}-"
  instance_type = "${var.instance_type}"
  key_name      = "${var.key_pair_name}"
  image_id      = "${data.aws_ami.ecs.id}"
  iam_instance_profile = "${aws_iam_instance_profile.ecs_instance.name}"
  security_groups      = ["${aws_security_group.ecs_instance.id}"]

  user_data    = <<EOF
#!/bin/bash
echo "ECS_CLUSTER=${var.name}" >> /etc/ecs/ecs.config
echo "ECS_LOGLEVEL=${var.log_level}" >> /etc/ecs/ecs.config
echo "ECS_VERSION=${var.agent_version}" >> /etc/ecs/ecs.config
EOF

  lifecycle {
    create_before_destroy = true
  }
}

