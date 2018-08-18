

variable "name" {
  description = "Name to be used on all the resources as identifier"
  default     = ""
}

variable "aws_region" {}

variable "account" {
  description = ""
  default = "TEST"
}

variable "tags" {}

variable "count_number" {
  default = 2
}

variable "vpc_id" {
  description = "The ID of the VPC in which to deploy the ELB."
}

variable "subnet_ids" {
  type = "list"
  description = "A list of public subnets for the instance(s)"
}

variable "instance_port" {
  description = "The port the EC2 Instance is listening on. The ELB will route traffic to this port."
}

variable "health_check_path" {
  description = "The path on the instance the ELB can use for health checks. Do NOT include a leading slash."
}

# ---------------------------------------------------------------------------------------------------------------------
# OPTIONAL MODULE PARAMETERS
# ---------------------------------------------------------------------------------------------------------------------

variable "lb_port" {
  description = "The port the ELB listens on."
  default = 80
}


