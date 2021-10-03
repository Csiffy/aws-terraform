# aws-terraform

Installing and Configuring the AWS CLI

```
$ sudo apt  install awscli
```

To check the version you have installed use the following command.

```
$ aws --version
```

Now you need to create a user or service account on AWS IAM

TODO

Configuring the credential

```
$ aws configure
```

Recommended Naming Convention

```
Default Pattern Format:
AWSServiceType-RegionCode-AvailabilityZoneCode-EnvironmentCode-ApplicationCode-UniqueNumber

Default Pattern Components:
- AWSServiceType: (vpc|subnet|rtb|acl|igw|ec2) for VPC, Subnet, Route Table, Network ACL, Internet Gateway, EC2 instance
- RegionCode: (use1|usw1|usw2|euw1|euc1|apn1|apn2|aps1|aps2|sae1) for us-east-1, us-west-1, us-west-2, eu-west-1, eu-central-1, ap-northeast-1, ap-northeast-2, ap-southeast-1, ap-southeast-2, sa-east-1
- AvailabilityZoneCode: ([1-2]{1})([a-c]{1}) e.g. e.g. (2a|2b|2c) for us-west-2a, us-west-2b, us-west-2c
- EnvironmentCode: (dev|tst|stg|prod) for development, test, staging, production
- ApplicationCode: ([a-z0-9]+) for
          - application that run on the EC2 instances (e.g. nginx, nodejs)
          - application stack that runs within the VPC (e.g. webapp_stack)
          - application installed on the AMIs (e.g. apache, nginx)
- UniqueNumber: ([0-9]{1,4})

Default Pattern Examples:
vpc-euw1-prod-web_app_stack
subnet-euw1-2a-tst-public
rtb-euw1-2a-tst-public
acl-euw1-2a-tst-public
igw-euw1-tst-public
ec2-euw1-2a-stg-tomcat-001
ec2-euw1-2b-prod-nodejs-021
```

Recommended Tags

```
Suggested TAGs:
Project: learning
Environment: test
Managed_By: terraform
Location: global
Owner: Csiffy
Service: basic_infrastructure
```

Please fill out the "modules/credential/variables.tf" file for the authentication.
The "account_keys" is the AWS_ACCESS_KEY_ID and the "account_secrets" is the AWS_SECRET_ACCESS_KEY.
There are some example account names or extend with a new one.

When you use one module please pass the account parameter with the right account name.
You are able to use different account/user/access key
(Please be aware of it is not a security related solution) 

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


