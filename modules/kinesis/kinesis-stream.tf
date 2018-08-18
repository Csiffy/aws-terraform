
resource "aws_kinesis_stream" "this" {
  provider         = "aws.current"
  name             = "${var.name}-stream"
  shard_count      = 1
  retention_period = 48

  tags = "${merge(var.tags, map("Name", format("%s", var.name)))}"
}





