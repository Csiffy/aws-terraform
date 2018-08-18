

module "credential" {
  source  = "../credential"
  account = "TEST"
}

# Configure the AWS Provider
provider "aws" {
  alias    = "current"
  version = "> 0.1"
  access_key = "${module.credential.access_key}"
  secret_key = "${module.credential.secret_key}"
  region     = "${var.aws_region}"
}

