

variable "name" {
  description = "Name to be used on all the resources as identifier"
  default     = ""
}

variable "aws_region" {}

variable "account" {
  description = ""
  default = "TEST"
}

variable "private_subnets" {
  type = "list"
}

variable "dbname" {
  type = "string"
  description = "specify a database name"
  default = "default_dbname"
}

variable "username" {
  type = "string"
  description = "describe your variable"
  default = "default_username"
}

variable "password" {
  type = "string"
  description = "describe your variable"
}

variable "instance_class" {
  type = "string"
  description = "describe your variable"
  default = "db.t2.micro"
}

variable "skip_final_snapshot" {
  default = false
}



