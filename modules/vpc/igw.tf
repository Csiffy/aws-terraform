
resource "aws_internet_gateway" "public" {
  provider = "aws.current"
  count    = "${length(var.public_subnets) > 0 ? 1 : 0}"

  vpc_id   = "${aws_vpc.this.id}"

  tags     = "${merge(var.tags, map("Name", format("%s-igw", var.name)))}"
}

