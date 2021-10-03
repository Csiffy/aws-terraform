
#########################################################################
# PERMISSIONS
#########################################################################

resource "aws_iam_role" "iam_for_lambda" {
  provider         = aws.current
  name = "iam_role_for_${var.name}-lambda-function"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

resource "aws_lambda_permission" "allow_apigateway" {
  statement_id   = "AllowExecutionFromAPIGateway"
  action         = "lambda:InvokeFunction"
  function_name  = "${aws_lambda_function.this.function_name}"
  principal      = "apigateway.amazonaws.com"
  source_account = "${var.account_id}"
  source_arn     = "arn:aws:execute-api:${var.aws_region}:${var.account_id}:${var.apigw_id}/*/*/*"
  #source_arn    = "arn:aws:execute-api:${var.myregion}:${var.account_id}:${aws_api_gateway_rest_api.api.id}/*/${aws_api_gateway_method.method.http_method}${aws_api_gateway_resource.resource.path}"
  #qualifier      = "${aws_lambda_alias.test_alias.name}"
}

#########################################################################
# RESOURCES
#########################################################################

resource "aws_lambda_function" "this" {
  provider         = aws.current
  filename         = "lambda-${var.name}.zip"
  source_code_hash = "${base64sha256(file("lambda-${var.name}.zip"))}"
  function_name    = "${var.name}"
  role             = "${aws_iam_role.iam_for_lambda.arn}"
  handler          = "${var.name}.${var.handler}"
  runtime          = "${var.runtime}"
  #runtime          = "nodejs4.3"
  #runtime          = "python2.7"
  #publish = true
  environment = {
    variables = "${var.environment}"
  }
}

#vpc_config {
#security_group_ids = ["${split(",", replace("${var.datapipeline_sg_ids},${var.default_sg_ids}", "/,$/", ""))}"]
#subnet_ids = ["${split(",", var.datapipeline_subnet_ids)}"]
#}

/*
resource "aws_lambda_alias" "test_alias" {
  provider         = aws.current
  name             = "testalias"
  description      = "a sample description"
  function_name    = "${aws_lambda_function.lambda_function_test.arn}"
  function_version = "$LATEST"
}


#In the aws_lambda_function -> source_code_hash = "${base64sha256(file("${data.archive_file.lambda.output_path}"))}"
data "archive_file" "lambda" {
  provider    = aws.current
  type        = "zip"
  source_file = "${var.name}.py"
  output_path = "lambda-${var.name}.zip"
}
*/

