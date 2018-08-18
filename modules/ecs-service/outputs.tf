

output "service_name" {
  value = "${aws_ecs_service.this.name}"
}

output "service_id" {
  value = "${aws_ecs_service.this.id}"
}

output "service_cluster" {
  value = "${aws_ecs_service.this.cluster}"
}

output "service_desired_count" {
  value = "${aws_ecs_service.this.desired_count}"
}

output "task_definition_family" {
  value = "${aws_ecs_task_definition.this.family}"
}




