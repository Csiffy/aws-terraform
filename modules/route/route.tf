

resource "aws_route53_zone" "main" {
  provider = aws.current
  name     = "example.com"
}

resource "aws_route53_zone" "dev" {
  provider = aws.current
  name     = "dev.example.com"
  tags     = "${merge(var.tags, map("Name", format("%s-53zone", var.name)))}"
}

resource "aws_route53_record" "dev-ns" {
  provider = aws.current
  zone_id  = "${aws_route53_zone.main.zone_id}"
  name     = "dev.example.com"
  type     = "NS"
  ttl      = "30"

  records  = [
    "${aws_route53_zone.dev.name_servers.0}",
    "${aws_route53_zone.dev.name_servers.1}",
    "${aws_route53_zone.dev.name_servers.2}",
    "${aws_route53_zone.dev.name_servers.3}",
  ]
}




