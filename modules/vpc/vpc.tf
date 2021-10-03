
locals {
  module_tags = tomap({"Service" = var.service_name})
}

resource "aws_vpc" "this" {
  provider             = aws.current
  cidr_block           = "${var.cidr}"
  instance_tenancy     = "${var.instance_tenancy}"
  enable_dns_hostnames = true
  enable_dns_support   = true
  tags     = merge(local.common_tags, local.module_tags, tomap({"Name" = format("vpc-%s-%s-%s_stack", var.aws_short_region, var.environment, var.name)}))
}

/*
resource "aws_vpc_dhcp_options_association" "dns_resolver" {
  vpc_id          = "${aws_vpc.this.id}"
  dhcp_options_id = "${aws_vpc_dhcp_options.foo.id}"
}

resource "aws_vpc_dhcp_options" "test" {
  domain_name          = "service.consul"
  domain_name_servers  = ["127.0.0.1", "10.0.0.2"]
  ntp_servers          = ["127.0.0.1"]
  netbios_name_servers = ["127.0.0.1"]
  netbios_node_type    = 2

  tags {
    Name = "test-name"
  }
}
*/
