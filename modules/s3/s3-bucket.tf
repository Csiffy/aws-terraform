

resource "aws_s3_bucket" "this" {
  provider = "aws.current"
  bucket   = "aws-test-bucket-${var.name}"
  acl      = "private"

  tags = "${merge(var.tags, map("Name", format("%s", var.name)))}"

}


