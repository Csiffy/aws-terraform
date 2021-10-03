
resource "aws_ecs_service" "this" {
  provider = aws.current
  name = "${var.name}"
  cluster = "${var.ecs_cluster_id}"
  task_definition = "${aws_ecs_task_definition.this.arn}"
  desired_count = "${var.desired_count}"
  iam_role = "${aws_iam_role.ecs_service_role.arn}"

  deployment_minimum_healthy_percent = "${var.deployment_minimum_healthy_percent}"
  deployment_maximum_percent = "${var.deployment_maximum_percent}"

  load_balancer {
    target_group_arn = "${var.target_group_arn}"
    container_name   = "${var.name}"
    container_port   = "${var.container_port}"
  }

  depends_on = ["aws_iam_role_policy.ecs_service_policy"]
}


