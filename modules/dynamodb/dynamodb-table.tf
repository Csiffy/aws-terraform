
resource "aws_dynamodb_table" "checkin_table" {
  provider       = aws.current
  name           = "${var.name}-checkin-table"
  read_capacity  = 20
  write_capacity = 20
  hash_key       = "CheckInID"
  stream_enabled = true
  stream_view_type = "NEW_AND_OLD_IMAGES"

  attribute {
    name = "CheckInID"
    type = "N"
  }

  tags = "${merge(var.tags, map("Name", format("%s", var.name)))}"
}

resource "aws_dynamodb_table" "placeid_table" {
  provider       = aws.current
  name           = "${var.name}-restaurant-table"
  read_capacity  = 20
  write_capacity = 20
  hash_key       = "PlaceID"

  attribute {
    name = "PlaceID"
    type = "N"
  }

  tags = "${merge(var.tags, map("Name", format("%s", var.name)))}"
}


