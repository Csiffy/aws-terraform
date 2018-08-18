

variable "name" {
  description = "Name to be used on all the resources as identifier"
  default     = ""
}

variable "aws_region" {}

variable "account" {
  description = ""
  default = "TEST"
}

variable "tags" {
  description = ""
  type = "map"
  default = {}
}

variable "count_number" {
  default = 1
}

variable "vpc" {}

variable "public_subnets" {
  type = "list"
  description = "A list of public subnets for the instance(s)"
  default     = []
}

#variable "security_groups" {
#  type = "list"
#  description = "All security groups"
#  default = []
#}


