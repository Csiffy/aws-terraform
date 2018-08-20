# aws-terraform

To use either modules the most important prerequisite is the credential module.

Please fill out the "modules/credential/variables.tf" file for the authentication.
The "account_keys" is the AWS_ACCESS_KEY_ID and the "account_secrets" is the AWS_SECRET_ACCESS_KEY.
There are some example account name or extend with a new one.

When you use one module please pass the account parameter with the right account name.
You be able to use different account/user/access key
(Please be aware of it is not a security related feature) 

If you would like to implement similar infrastructure under different account and region, because of High availability or for other reason, then you can do it easily.

```
// in the modules/credential/variables.tf file
variable "account_keys" {
  default = {
    "ACCOUNT1"   = ""
    "ACCOUNT2"   = ""
  }
}
variable "account_secrets" {
  default = {
    "ACCOUNT1"   = ""
    "ACCOUNT2"   = ""
  }
}
```

Create a new project and use for example the vpc module
```
// for example in the main.tf file
module "xxxxx_vpc" {
  source = "../modules/vpc"

  name = "xxxxxx vpc"

  aws_region = "eu-central-1"
  account = "ACCOUNT1"
  ...
}
module "xxxxx_vpc" {
  source = "../modules/vpc"

  name = "xxxxxx vpc"

  aws_region = "eu-central-1"
  account = "ACCOUNT2"
  ...
}
```


