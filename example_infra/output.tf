

output "vpc_id" {
  value = "${module.euwest1_vpc.vpc_id}"
}

output "private_subnets" {
  value = ["${module.euwest1_vpc.private_subnets}"]
}

output "public_subnets" {
  value = ["${module.euwest1_vpc.public_subnets}"]
}




