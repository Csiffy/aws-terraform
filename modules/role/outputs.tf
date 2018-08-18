

output "iam_s3_full_access" {
  value = "${aws_iam_instance_profile.this.id}"
}


