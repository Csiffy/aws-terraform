

terraform {
  backend "local" {
    path = "../tfstate/terraform-test-infra.tfstate"
  }
}


module "euwest1_vpc" {
  source = "../modules/vpc"

  project = "learning"
  environment = "tst"

  name = "webapp"
  service_name = "basic_infrastructure"

  location = "global"

  aws_region = "eu-west-1"
  aws_short_region = "ew1"

  account = "TEST"
  cidr = "10.0.0.0/16"
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24"]
  public_subnets  = ["10.0.101.0/24", "10.0.102.0/24"]

  #enable_nat_gateway = "true"

  #azs      = ["eu-west-1a", "eu-west-1b", "eu-west-1c"]
  azs      = ["eu-west-1a", "eu-west-1b"]

}
