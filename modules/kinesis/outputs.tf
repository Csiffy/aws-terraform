

output "id" {
  value = "${aws_kinesis_stream.this.id}"
}

output "arn" {
  value = "${aws_kinesis_stream.this.arn}"
}

output "name" {
  value = "${aws_kinesis_stream.this.name}"
}

output "shared_count" {
  value = "${aws_kinesis_stream.this.shard_count}"
}







