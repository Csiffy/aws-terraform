
output "sns_id" {
  value = "${aws_sns_topic.this.id}"
}

output "sns_arn" {
  value = "${aws_sns_topic.this.arn}"
}

output "sqs_id" {
  value = "${aws_sqs_queue.this.id}"
}

output "sqs_arn" {
  value = "${aws_sqs_queue.this.arn}"
}
