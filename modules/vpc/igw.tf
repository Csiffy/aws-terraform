
resource "aws_internet_gateway" "public" {
  provider = aws.current
  count    = "${length(var.public_subnets) > 0 ? 1 : 0}"

  vpc_id   = "${aws_vpc.this.id}"

  tags     = merge(local.common_tags, local.module_tags, tomap({"Name" = format("igw-%s-%s-public", var.aws_short_region, var.environment)}))
}

