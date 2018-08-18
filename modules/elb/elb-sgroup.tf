
resource "aws_security_group" "elb" {
  name = "${var.name}"
  description = "The security group for the ${var.name} ELB"
  vpc_id = "${var.vpc_id}"
}

resource "aws_security_group_rule" "all_outbound_all" {
  type = "egress"
  from_port = 0
  to_port = 0
  protocol = "-1"
  cidr_blocks = ["0.0.0.0/0"]
  security_group_id = "${aws_security_group.elb.id}"
}

resource "aws_security_group_rule" "all_inbound_all" {
  type = "ingress"
  from_port = "${var.lb_port}"
  to_port = "${var.lb_port}"
  protocol = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
  security_group_id = "${aws_security_group.elb.id}"
}

