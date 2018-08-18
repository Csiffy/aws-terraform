

### Create route tables
resource "aws_route_table" "public" {
  provider = "aws.current"
  #count   = "${length(var.public_subnets)}"
  count    = "${length(var.azs)}"
  vpc_id   = "${aws_vpc.this.id}"
  tags     = "${merge(var.tags, map("Name", format("%s-rt-public-%s", var.name, element(var.azs, count.index))))}"
}

resource "aws_route_table" "private" {
  provider = "aws.current"
  count    = "${length(var.azs)}"
  vpc_id   = "${aws_vpc.this.id}"
  tags     = "${merge(var.tags, map("Name", format("%s-rt-private-%s", var.name, element(var.azs, count.index))))}"
}

### Associates subnet with routing table
resource "aws_route_table_association" "private" {
  provider       = "aws.current"
  count          = "${length(var.private_subnets)}"
  subnet_id      = "${element(aws_subnet.private.*.id, count.index)}"
  route_table_id = "${element(aws_route_table.private.*.id, count.index)}"
}

resource "aws_route_table_association" "public" {
  provider       = "aws.current"
  count          = "${length(var.public_subnets)}"
  subnet_id      = "${element(aws_subnet.public.*.id, count.index)}"
  route_table_id = "${element(aws_route_table.public.*.id, count.index)}"
}

resource "aws_route" "public_route_to_igw" {
  provider               = "aws.current"
  count                  = "${length(var.azs)}"
  route_table_id         = "${element(aws_route_table.public.*.id, count.index)}"
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = "${aws_internet_gateway.public.id}"
}

