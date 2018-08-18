
#************************************************
# VPC section
#************************************************

output "vpc_id" {
  value = "${aws_vpc.this.id}"
}

output "cidr_block" {
  value = "${aws_vpc.this.cidr_block}"
}

output "enable_dns_support" {
  value = "${aws_vpc.this.enable_dns_support}"
}

output "enable_dns_hostnames" {
  value = "${aws_vpc.this.enable_dns_hostnames}"
}

output "main_route_table_id" {
  value = "${aws_vpc.this.main_route_table_id}"
}

output "default_network_acl_id" {
  value = "${aws_vpc.this.default_network_acl_id}"
}

output "default_security_group_id" {
  value = "${aws_vpc.this.default_security_group_id}"
}

output "default_route_table_id" {
  value = "${aws_vpc.this.default_route_table_id}"
}

#************************************************
# Subnet section
#************************************************

output "private_subnets" {
  value = ["${aws_subnet.private.*.id}"]
}

output "public_subnets" {
  value = ["${aws_subnet.public.*.id}"]
}

output "private_subnets_az" {
  value = ["${aws_subnet.private.*.availability_zone}"]
}

output "public_subnets_az" {
  value = ["${aws_subnet.public.*.availability_zone}"]
}

output "private_subnets_cidr_block" {
  value = ["${aws_subnet.private.*.cidr_block}"]
}

output "public_subnets_cidr_block" {
  value = ["${aws_subnet.public.*.cidr_block}"]
}

#************************************************
# Route section
#************************************************

output "private_routetable_id" {
  value = ["${aws_route_table.private.*.id}"]
}

output "public_routetable_id" {
  value = ["${aws_route_table.public.*.id}"]
}

#************************************************
# Others
#************************************************

output "public_networkacl_id" {
  value = ["${aws_network_acl.public.*.id}"]
}

output "public_internet_gateway_id" {
  value = ["${aws_internet_gateway.public.*.id}"]
}

output "aws_region" {
  value = "${var.aws_region}"
}



