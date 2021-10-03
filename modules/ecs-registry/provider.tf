
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.61.0"
    }
  }
}

module "credential" {
  source  = "../credential"
  acoount = "TEST"
}

# Configure the AWS Provider
provider "aws" {
  alias    = "current"
  access_key = "${module.credential.access_key}"
  secret_key = "${module.credential.secret_key}"
  region     = "${var.aws_region}"
}

