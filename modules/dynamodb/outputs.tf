

output "fb_db_id" {
  value = "${aws_dynamodb_table.checkin_table.id}"
}

output "fb_db_arn" {
  value = "${aws_dynamodb_table.checkin_table.arn}"
}

output "places_db_id" {
  value = "${aws_dynamodb_table.placeid_table.id}"
}

output "places_db_arn" {
  value = "${aws_dynamodb_table.placeid_table.arn}"
}







