

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
  default = {}
}

