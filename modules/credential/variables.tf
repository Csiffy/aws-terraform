

variable "account" {}

variable "account_keys" {
  default = {
    "PRODUCTION"   = ""
    "DEVELOPMENT"  = ""
    "TEST"         = ""
    "TRAINING"     = ""
  }
}

variable "account_secrets" {
  default = {
    "PRODUCTION"   = ""
    "DEVELOPMENT"  = ""
    "TEST"         = ""
    "TRAINING"     = ""
  }
}
