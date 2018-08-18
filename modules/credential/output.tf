

output "access_key" {
  value = "${lookup(var.account_keys, var.account)}"
}

output "secret_key" {
  value = "${lookup(var.account_secrets, var.account)}"
}
