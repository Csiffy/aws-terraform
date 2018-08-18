

output "alb_url" {
  value = "${aws_alb.this.dns_name}"
}


output "alb_target_group_arn" {
  value = "${aws_alb_target_group.this.arn}"
}


output "alb_arn" {
  value = "${aws_alb.this.arn}"
}


output "alb_listener_arn" {
  value = "${aws_alb_listener.this.arn}"
}

