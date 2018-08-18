
# Amazon Linux AMI 2017.03.1 (HVM), SSD Volume Type
variable "aws_amis" {
  default = {
    eu-west-1 = "ami-ebd02392"
    eu-west-2 = "ami-489f8e2c"
  }
}

variable "name" {
  description = "Name to be used on all the resources as identifier"
  default     = ""
}

variable "aws_region" {}

variable "account" {
  description = ""
  default = "TEST"
}

variable "key_name" {}

variable "public_key_path" {}

variable "tags" {}

variable "count_number" {
  default = 2
}

variable "vpc" {}

variable "private_subnets" {
  type = "list"
  description = "A list of private subnets for the instance(s)"
  default     = []
}

variable "public_subnets" {
  type = "list"
  description = "A list of public subnets for the instance(s)"
  default     = []
}

variable "iamrole" {}
