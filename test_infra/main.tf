

terraform {
  backend "local" {
    path = "../tfstate/terraform-test-infra.tfstate"
  }
}


module "euwest1_vpc" {
  source = "../modules/vpc"

  name = "tf-eu-west-1"

  aws_region = "eu-west-1"
  account = "TEST"
  cidr = "10.0.0.0/16"
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24"]
  public_subnets  = ["10.0.101.0/24", "10.0.102.0/24"]

  #enable_nat_gateway = "true"

  #azs      = ["eu-west-1a", "eu-west-1b", "eu-west-1c"]
  azs      = ["eu-west-1a", "eu-west-1b"]

  tags {
    "Name"        = "tf-eu-west-1"
    "Environment" = "Test"
    "CreatedBy"   = "Terraform"
    "Created"     = "Csiffy"
  }
}

module "euwest1_ecsreg" {
  source = "../modules/ecs-registry"
  namespace = "test"
  repository = "alpine"
  aws_region = "${module.euwest1_vpc.aws_region}"
  account = "TEST"
}

module "euwest1_random" {
  source = "../modules/random"
  length = 8
}

module "euwest1_message" {
  source = "../modules/message"
  aws_region = "${module.euwest1_vpc.aws_region}"
  account = "TEST"
  name = "tf-eu-west-1"
}

module "euwest2_vpc" {
  source = "../modules/vpc"

  name = "tf-eu-west-2"

  aws_region = "eu-west-2"
  account = "TEST"
  cidr = "10.0.0.0/16"
  private_subnets = ["10.0.10.0/24", "10.0.20.0/24"]
  public_subnets  = ["10.0.111.0/24", "10.0.112.0/24"]
  azs      = ["eu-west-2a", "eu-west-2b"]

  tags {
    "Name"        = "tf-eu-west-2"
    "Environment" = "Test"
    "CreatedBy"   = "Terraform"
    "Created"     = "Csiffy"
  }
}
