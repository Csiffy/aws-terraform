

output "arn" {
  value = "${aws_lambda_function.this.arn}"
}

output "name" {
  value = "${aws_lambda_function.this.function_name}"
}

output "version" {
  value = "${aws_lambda_function.this.version}"
}

