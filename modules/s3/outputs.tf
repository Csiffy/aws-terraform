

output "bucket_url" {
  value = "${aws_s3_bucket.this.bucket_domain_name}"
}

output "iam_s3_full_access" {
  value = "${aws_iam_instance_profile.this.id}"
}

output "bid" {
  value = "${aws_s3_bucket.this.id}"
}

