
resource "aws_subnet" "private" {
  provider          = aws.current
  count             = "${length(var.private_subnets)}"

  vpc_id            = "${aws_vpc.this.id}"
  cidr_block        = "${var.private_subnets[count.index]}"
  availability_zone = "${element(var.azs, count.index)}"

  tags     = merge(local.common_tags, local.module_tags, var.private_subnet_tags, tomap({"Name" = format("subnet-%s-%s-%s-private", var.aws_short_region, split("-", element(var.azs, count.index))[2], var.environment)}))
}

resource "aws_subnet" "public" {
  provider                = aws.current
  count                   = "${length(var.public_subnets)}"

  vpc_id                  = "${aws_vpc.this.id}"
  cidr_block              = "${var.public_subnets[count.index]}"
  availability_zone       = "${element(var.azs, count.index)}"
  map_public_ip_on_launch = "${var.map_public_ip_on_launch}"

  tags     = merge(local.common_tags, local.module_tags, var.private_subnet_tags, tomap({"Name" = format("subnet-%s-%s-%s-public", var.aws_short_region, split("-", element(var.azs, count.index))[2], var.environment)}))
}

