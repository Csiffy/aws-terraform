

resource "aws_route53_health_check" "this" {
  provider          = aws.current
  fqdn              = "${var.alb_dns}"
  port              = 80
  type              = "HTTP"
  resource_path     = "/"
  failure_threshold = "3"
  request_interval  = "30"

  tags = "${merge(var.tags, map("Name", format("%s-healthcheck", var.name)))}"
}



