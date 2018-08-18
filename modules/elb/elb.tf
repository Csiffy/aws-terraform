
resource "aws_elb" "elb" {
  name = "${var.name}"
  subnets = ["${var.subnet_ids}"]
  security_groups = ["${aws_security_group.elb.id}"]
  cross_zone_load_balancing = true

  health_check {
    healthy_threshold = 2
    unhealthy_threshold = 2
    timeout = 5
    interval = 15

    target = "HTTP:${var.instance_port}/${var.health_check_path}"
  }

  listener {
    instance_port = "${var.instance_port}"
    instance_protocol = "http"
    lb_port = "${var.lb_port}"
    lb_protocol = "http"
  }
}


