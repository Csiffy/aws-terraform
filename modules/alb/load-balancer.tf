

resource "aws_security_group" "this" {
  provider    = "aws.current"
  name        = "${var.name}-alb_sg"
  description = "Application Load Balancing security group"
  vpc_id      = "${var.vpc}"

  # HTTP access from the VPC
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

# outbound internet access
  egress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_alb_target_group" "this" {
  provider = "aws.current"
  name     = "${var.name}-alb-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = "${var.vpc}"
}

#resource "aws_alb_target_group_attachment" "this" {
#  provider         = "aws.current"
#  count            = "${var.count_number}"
#  target_group_arn = "${aws_alb_target_group.this.arn}"
#  #target_id       = "${var.instances}"
#  target_id        = "${element(split(",", var.instances), count.index)}"
#  port             = 80
#}

resource "aws_alb" "this" {
  provider        = "aws.current"
#  count           = "${var.count_number}"
  subnets         = ["${var.public_subnets}"]
  security_groups = ["${aws_security_group.this.id}"]
  internal        = false
#  subnets         = ["${aws_subnet.public.*.id}"]

  tags = "${merge(var.tags, map("Name", format("%s-alb", var.name)))}"

}

resource "aws_alb_listener" "this" {
  provider          = "aws.current"
  load_balancer_arn = "${aws_alb.this.arn}"
  port              = "80"
  protocol          = "HTTP"

  default_action {
    target_group_arn = "${aws_alb_target_group.this.arn}"
    type             = "forward"
  }
}

resource "aws_alb_listener_rule" "this" {
  provider     = "aws.current"
  listener_arn = "${aws_alb_listener.this.arn}"
  priority     = 100

  action {
    type             = "forward"
    target_group_arn = "${aws_alb_target_group.this.arn}"
  }

  condition {
    field  = "path-pattern"
    values = ["/static/*"]
  }
}

