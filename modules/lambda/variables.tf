

variable "name" {
  description = "The name of the lambda to create, which also defines (i) the archive name (.zip), (ii) the file name, and (iii) the function name"
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

variable "runtime" {
  description = "The runtime of the lambda to create"
  default     = "nodejs"
}

variable "handler" {
  description = "The handler name of the lambda (a function defined in your lambda)"
  default     = "handler"
}

variable "description" {
  description = "You can specify description for the lambda function"
  default     = "Lambda function"
}

variable "environment" {
  description = ""
  type = "map"
  default = {
    test = "test"
  }
}

#TODO lehet nem kell, ha mukodik cred modulebol az account_id
variable "account_id" {
  default = "xxxxx"
}

variable "apigw_id" {
  type = "string"
  description = "describe your variable"
  default = "default_value"
}

