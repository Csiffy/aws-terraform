

output "rid-std" {
  value = "${random_id.this.b64_std}"
}

output "rid-url" {
  value = "${random_id.this.b64_url}"
}

output "rstring" {
  value = "${random_string.this.result}"
}
