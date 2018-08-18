

output "aws_region" {
  value = "${var.aws_region}"
}

output "aws_instance" {
  value = ["${aws_instance.this.*.id}"]
}

output "aws_security_group" {
  value = ["${aws_security_group.instance-sg.*.id}"]
}

output "instances" {
  value = "${join(",", aws_instance.this.*.id)}"
}

