

variable "name" {
  description = "Name to be used on all the resources as identifier"
  default     = ""
}

variable "aws_region" {}

variable "account" {
  description = ""
  default = "TEST"
}

variable "count_number" {
  default = 2
}

variable "ecs_cluster_id" {
  description = "The ID of the ECS Cluster"
}

variable "image" {
  description = "The Docker image to run in the ECS Task"
}

variable "version" {
  description = "The version of the Docker image to run in the ECS Task"
}

variable "cpu" {
  description = "The number of CPU units to give the ECS Task, where 1024 represents one vCPU."
}

variable "memory" {
  description = "The amount of memory, in MB, to give the ECS Task."
}

variable "container_port" {
  description = "The port the Docker container in the ECS Task is listening on."
}

variable "host_port" {
  description = "The port on the host to map to var.container_port."
}

variable "desired_count" {
  description = "The number of ECS Tasks to run for this ECS Service"
}

variablo "target_group_arn" {
  description = "The name of the Target Group (ELB,ALB) with which this ECS Service should register."
}

variable "env_vars" {
  description = "The environment variables to make available in each ECS Task"
  type = "map"
  default = {}
}

variable "num_env_vars" {
  description = "The number of environment variables in var.env_vars"
  default = 0
}

variable "deployment_maximum_percent" {
  description = "The upper limit, as a percentage of var.desired_count, of the number of running ECS Tasks that can be running in a service during a deployment"
  default = 200
}

variable "deployment_minimum_healthy_percent" {
  description = "The lower limit, as a percentage of var.desired_count, of the number of running ECS Tasks that must remain running and healthy in a service during a deployment"
  default = 100
}




