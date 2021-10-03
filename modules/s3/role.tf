
### Data section
data "aws_iam_policy_document" "ec2_assumerole" {
  statement {
    actions = ["sts:AssumeRole"]
    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }
  }
}

data "aws_iam_policy_document" "s3_full_access_policy" {
  statement {
      effect = "Allow"
      actions = [
        "s3:*"
      ]
      resources = [
        "*"
      ]
  }
}

### Resource section

## Create the necessary policy from a policy document
resource "aws_iam_policy" "s3_full_access_policy" {
  provider    = aws.current
  name        = "${var.name}-s3_full_access_policy"
  path        = "/"
  description = "Policy for full access to S3"
  policy      = "${data.aws_iam_policy_document.s3_full_access_policy.json}"
}

## Create an IAM role for the Web Servers
resource "aws_iam_role" "s3_full_access_role" {
  provider           = aws.current
  name               = "${var.name}-s3-full-access"
  assume_role_policy = "${data.aws_iam_policy_document.ec2_assumerole.json}"
}

## Create an instance profile for the role, ensure to use this role at instance level
resource "aws_iam_instance_profile" "this" {
  provider = aws.current
  name     = "${var.name}-s3_full_instance_profile"
  role     = "${aws_iam_role.s3_full_access_role.name}"
}

## Attach the policy to some different resource (like: user, group, role)
resource "aws_iam_policy_attachment" "s3_full_access_attachment" {
  provider   = aws.current
  name       = "${var.name}-s3-full-access-policy-attachment"
  roles      = ["${aws_iam_role.s3_full_access_role.name}"]
  policy_arn = "${aws_iam_policy.s3_full_access_policy.arn}"
}

