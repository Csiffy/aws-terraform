

resource "random_string" "this" {
  length = "${var.length}"
  upper = "${var.upper}"
  lower = "${var.lower}"
  number = "${var.number}"
  special = "${var.special}"
}

resource "random_id" "this" {
  byte_length = "${var.length}"
}




