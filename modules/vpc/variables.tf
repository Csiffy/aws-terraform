
variable "name" {
  description = "Name to be used on all the resources as identifier"
  default     = ""
}

variable "aws_region" {}

variable "aws_short_region" {}

variable "account" {
  description = ""
  default = "TEST"
}

variable "project" {}

variable "environment" {}

variable "location" {}

variable "service_name" {}

variable "cidr" {
  description = "The CIDR block for the VPC"
  default     = ""
}

variable "public_subnets" {
  description = "A list of public subnets inside the VPC."
  default     = []
}

variable "private_subnets" {
  description = "A list of private subnets inside the VPC."
  default     = []
}

variable "instance_tenancy" {
  description = "A tenancy option for instances launched into the VPC"
  default     = "default"
}

variable "azs" {
  description = "A list of Availability zones in the region"
  default     = []
}

variable "map_public_ip_on_launch" {
  description = "should be false if you do not want to auto-assign public IP on launch"
  default     = true
}

variable "public_subnet_tags" {
  description = "Additional tags for the public subnets"
  default     = {}
}

variable "private_subnet_tags" {
  description = "Additional tags for the public subnets"
  default     = {}
}

variable "tags" {
  description = "A map of the tags to use for the resources that are deployed"
  type        = map
  default = {}
}

locals {
  common_tags = {
    Project = var.project
    Environment = var.environment
    Managed_By = "terraform"
    Location = var.location
    OwnerName = "Csiffy"
    OwnerCode = "C001"
  }
}
