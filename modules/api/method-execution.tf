
##########################################################
# Resource section
##########################################################

resource "aws_api_gateway_resource" "movies" {
  provider    = aws.current
  rest_api_id = "${aws_api_gateway_rest_api.movies.id}"
  parent_id   = "${aws_api_gateway_rest_api.movies.root_resource_id}"
  path_part   = "movies"
}

resource "aws_api_gateway_resource" "getall" {
  provider    = aws.current
  rest_api_id = "${aws_api_gateway_rest_api.movies.id}"
  parent_id   = "${aws_api_gateway_resource.movies.id}"
  path_part   = "getall"
}

resource "aws_api_gateway_resource" "getbyid" {
  provider    = aws.current
  rest_api_id = "${aws_api_gateway_rest_api.movies.id}"
  parent_id   = "${aws_api_gateway_resource.movies.id}"
  path_part   = "getbyid"
}

resource "aws_api_gateway_resource" "getbyid_id" {
  provider    = aws.current
  rest_api_id = "${aws_api_gateway_rest_api.movies.id}"
  parent_id   = "${aws_api_gateway_resource.getbyid.id}"
  path_part   = "{id}"
}

resource "aws_api_gateway_resource" "getbyname" {
  provider    = aws.current
  rest_api_id = "${aws_api_gateway_rest_api.movies.id}"
  parent_id   = "${aws_api_gateway_resource.movies.id}"
  path_part   = "getbyname"
}

resource "aws_api_gateway_resource" "getbyname_name" {
  provider    = aws.current
  rest_api_id = "${aws_api_gateway_rest_api.movies.id}"
  parent_id   = "${aws_api_gateway_resource.getbyname.id}"
  path_part   = "{name}"
}

resource "aws_api_gateway_resource" "add" {
  provider    = aws.current
  rest_api_id = "${aws_api_gateway_rest_api.movies.id}"
  parent_id   = "${aws_api_gateway_resource.movies.id}"
  path_part   = "add"
}

resource "aws_api_gateway_resource" "deletebyid" {
  provider    = aws.current
  rest_api_id = "${aws_api_gateway_rest_api.movies.id}"
  parent_id   = "${aws_api_gateway_resource.movies.id}"
  path_part   = "deletebyid"
}

resource "aws_api_gateway_resource" "deletebyid_id" {
  provider    = aws.current
  rest_api_id = "${aws_api_gateway_rest_api.movies.id}"
  parent_id   = "${aws_api_gateway_resource.deletebyid.id}"
  path_part   = "{id}"
}

##########################################################
# Methodes section
##########################################################

resource "aws_api_gateway_method" "movies_getall" {
  provider      = aws.current
  rest_api_id   = "${aws_api_gateway_rest_api.movies.id}"
  resource_id   = "${aws_api_gateway_resource.getall.id}"
  http_method   = "GET"
  authorization = "NONE"
  #authorization = "AWS_IAM"
  #request_models = { "application/json" = "${var.request_model}" }
  request_parameters = { "method.request.header.X-Some-Header" = true } #HTTP Request Headers
  request_validator_id = "${aws_api_gateway_request_validator.all.id}"
}

resource "aws_api_gateway_method" "movies_getbyid" {
  provider      = aws.current
  rest_api_id   = "${aws_api_gateway_rest_api.movies.id}"
  resource_id   = "${aws_api_gateway_resource.getbyid_id.id}"
  http_method   = "GET"
  authorization = "NONE"
  request_parameters = { "method.request.header.X-Some-Header" = true } #HTTP Request Headers
  request_validator_id = "${aws_api_gateway_request_validator.all.id}"
}

resource "aws_api_gateway_method" "movies_getbyname" {
  provider      = aws.current
  rest_api_id   = "${aws_api_gateway_rest_api.movies.id}"
  resource_id   = "${aws_api_gateway_resource.getbyname_name.id}"
  http_method   = "GET"
  authorization = "NONE"
  request_models = { "application/json" = "Empty" } #Request Body
  request_parameters = { "method.request.header.X-Some-Header" = true } #HTTP Request Headers
  request_validator_id = "${aws_api_gateway_request_validator.all.id}"
}

resource "aws_api_gateway_method" "movies_add" {
  provider      = aws.current
  rest_api_id   = "${aws_api_gateway_rest_api.movies.id}"
  resource_id   = "${aws_api_gateway_resource.add.id}"
  http_method   = "POST"
  authorization = "NONE"
  request_parameters = { "method.request.header.X-Some-Header" = true } #HTTP Request Headers
  request_validator_id = "${aws_api_gateway_request_validator.all.id}"
}

resource "aws_api_gateway_method" "deletebyid" {
  provider      = aws.current
  rest_api_id   = "${aws_api_gateway_rest_api.movies.id}"
  resource_id   = "${aws_api_gateway_resource.deletebyid_id.id}"
  http_method   = "DELETE"
  authorization = "NONE"
  request_parameters = { "method.request.header.X-Some-Header" = true } #HTTP Request Headers
  request_validator_id = "${aws_api_gateway_request_validator.all.id}"
}

#resource "aws_api_gateway_method" "movies_post" {
#  provider      = aws.current
#  rest_api_id   = "${aws_api_gateway_rest_api.movies.id}"
#  resource_id   = "${aws_api_gateway_resource.movies.id}"
#  http_method   = "POST"
#  authorization = "NONE"
#  #authorization = "AWS_IAM"
#  #request_parameters = "${var.request_parameters}"
#  #request_models = { "application/json" = "${var.request_model}" }
#  #api_key_required = "(Optional) Specify if the method requires an API key"
#}

##########################################################
# Intergration section (Request)
##########################################################
#resource "aws_api_gateway_integration" "ResourceMethodIntegration" {
#  rest_api_id = "${aws_api_gateway_rest_api.movies.id}"
#  resource_id = "${aws_api_gateway_resource.movies.id}"
#  http_method = "${aws_api_gateway_method.movies_get.http_method}"
#  type = "AWS"
#  uri = "arn:aws:apigateway:${var.region}:lambda:path/2015-03-31/functions/arn:aws:lambda:${var.region}:${var.account_id}:function:${var.lambda_name}/invocations"
#  integration_http_method = "POST"
#  request_templates = { "application/json" = "${var.integration_request_template}" }
#  #integration_request_template = "#set($inputRoot = $input.path('$')){}"
#}

resource "aws_api_gateway_integration" "movies_getall" {
  provider    = aws.current
  rest_api_id = "${aws_api_gateway_rest_api.movies.id}"
  resource_id = "${aws_api_gateway_resource.getall.id}"
  http_method = "${aws_api_gateway_method.movies_getall.http_method}"
  type        = "AWS"
  uri = "arn:aws:apigateway:${var.aws_region}:lambda:path/2015-03-31/functions/arn:aws:lambda:${var.aws_region}:${var.account_id}:function:${var.lambda_name}/invocations"
  integration_http_method = "POST"

  request_templates {
      "application/json" = <<EOF
  {
     "body" : $input.json('$')
  }
  EOF
  }
}

resource "aws_api_gateway_integration" "getbyid" {
  provider    = aws.current
  rest_api_id = "${aws_api_gateway_rest_api.movies.id}"
  resource_id = "${aws_api_gateway_resource.getbyid_id.id}"
  http_method = "${aws_api_gateway_method.movies_getbyid.http_method}"
  type        = "AWS"
  uri = "arn:aws:apigateway:${var.aws_region}:lambda:path/2015-03-31/functions/arn:aws:lambda:${var.aws_region}:${var.account_id}:function:${var.lambda_name}/invocations"
  integration_http_method = "POST"

  request_templates {
      "application/json" = <<EOF
  {
     "body" : $input.json('$')
  }
  EOF
  }
}

resource "aws_api_gateway_integration" "getbyname" {
  provider    = aws.current
  rest_api_id = "${aws_api_gateway_rest_api.movies.id}"
  resource_id = "${aws_api_gateway_resource.getbyname_name.id}"
  http_method = "${aws_api_gateway_method.movies_getbyname.http_method}"
  type        = "AWS"
  uri = "arn:aws:apigateway:${var.aws_region}:lambda:path/2015-03-31/functions/arn:aws:lambda:${var.aws_region}:${var.account_id}:function:${var.lambda_name}/invocations"
  integration_http_method = "POST"

  request_templates {
      "application/json" = <<EOF
  {
     "body" : $input.json('$')
  }
  EOF
  }
}

resource "aws_api_gateway_integration" "add" {
  provider    = aws.current
  rest_api_id = "${aws_api_gateway_rest_api.movies.id}"
  resource_id = "${aws_api_gateway_resource.add.id}"
  http_method = "${aws_api_gateway_method.movies_add.http_method}"
  type        = "AWS"
  uri = "arn:aws:apigateway:${var.aws_region}:lambda:path/2015-03-31/functions/arn:aws:lambda:${var.aws_region}:${var.account_id}:function:${var.lambda_name}/invocations"
  integration_http_method = "POST"

  request_templates {
      "application/json" = <<EOF
  {
     "body" : $input.json('$')
  }
  EOF
  }
}

resource "aws_api_gateway_integration" "deletebyid" {
  provider    = aws.current
  rest_api_id = "${aws_api_gateway_rest_api.movies.id}"
  resource_id = "${aws_api_gateway_resource.deletebyid_id.id}"
  http_method = "${aws_api_gateway_method.deletebyid.http_method}"
  type        = "AWS"
  uri = "arn:aws:apigateway:${var.aws_region}:lambda:path/2015-03-31/functions/arn:aws:lambda:${var.aws_region}:${var.account_id}:function:${var.lambda_name}/invocations"
  #uri = "arn:aws:apigateway:${var.aws_region}:lambda:path/2015-03-31/functions/arn:aws:lambda:${var.aws_region}:${var.account_id}:function:${var.aws-lambda-function-name}/invocations"
  integration_http_method = "POST"

  request_templates {
      "application/json" = <<EOF
  {
     "body" : $input.json('$')
  }
  EOF
  }
}

##########################################################
# Integration section (Response)
##########################################################

resource "aws_api_gateway_integration_response" "movies_getall_ok" {
  provider    = aws.current
  depends_on  = ["aws_api_gateway_integration.movies_getall"]
  rest_api_id = "${aws_api_gateway_rest_api.movies.id}"
  resource_id = "${aws_api_gateway_resource.getall.id}"
  http_method = "${aws_api_gateway_method.movies_getall.http_method}"
  status_code = "${aws_api_gateway_method_response.getall_200.status_code}"

  #response_parameters = { "method.response.header.Access-Control-Allow-Origin" = "'*'" }
  response_templates = { "application/json" = "#set($inputRoot = $input.path('$')){}" }
  #integration_error_template = "#set ($errorMessageObj = $util.parseJson($input.path('$.errorMessage')) {\"message\" :\"$errorMessageObj.message\"}"

  # Transforms the backend JSON response to XML
#  response_templates {
#    "application/xml" = <<EOF
##set($inputRoot = $input.path('$'))
#<?xml version="1.0" encoding="UTF-8"?>
#<message>
#    $inputRoot.body
#</message>
#EOF
#  }
}

resource "aws_api_gateway_integration_response" "movies_getall_error" {
  provider    = aws.current
  depends_on  = ["aws_api_gateway_integration.movies_getall"]
  rest_api_id = "${aws_api_gateway_rest_api.movies.id}"
  resource_id = "${aws_api_gateway_resource.getall.id}"
  http_method = "${aws_api_gateway_method.movies_getall.http_method}"
  status_code = "${aws_api_gateway_method_response.getall_400.status_code}"
  selection_pattern = "error"
  #response_parameters = { "method.response.header.Access-Control-Allow-Origin" = "'*'" }
  response_templates = { "application/json" = "#set($inputRoot = $input.path('$')){}" }
  #integration_error_template = "#set ($errorMessageObj = $util.parseJson($input.path('$.errorMessage')) {\"message\" :\"$errorMessageObj.message\"}"
}

resource "aws_api_gateway_integration_response" "movies_getbyid_ok" {
  provider    = aws.current
  depends_on  = ["aws_api_gateway_integration.getbyid"]
  rest_api_id = "${aws_api_gateway_rest_api.movies.id}"
  resource_id = "${aws_api_gateway_resource.getbyid_id.id}"
  http_method = "${aws_api_gateway_method.movies_getbyid.http_method}"
  status_code = "${aws_api_gateway_method_response.getbyid_200.status_code}"

  #response_parameters = { "method.response.header.Access-Control-Allow-Origin" = "'*'" }
  response_templates = { "application/json" = "#set($inputRoot = $input.path('$')){}" }
  #integration_error_template = "#set ($errorMessageObj = $util.parseJson($input.path('$.errorMessage')) {\"message\" :\"$errorMessageObj.message\"}"
}

resource "aws_api_gateway_integration_response" "movies_getbyid_error" {
  provider    = aws.current
  depends_on  = ["aws_api_gateway_integration.getbyid"]
  rest_api_id = "${aws_api_gateway_rest_api.movies.id}"
  resource_id = "${aws_api_gateway_resource.getbyid_id.id}"
  http_method = "${aws_api_gateway_method.movies_getbyid.http_method}"
  status_code = "${aws_api_gateway_method_response.getbyid_400.status_code}"
  selection_pattern = "error"
  #response_parameters = { "method.response.header.Access-Control-Allow-Origin" = "'*'" }
  response_templates = { "application/json" = "#set($inputRoot = $input.path('$')){}" }
  #integration_error_template = "#set ($errorMessageObj = $util.parseJson($input.path('$.errorMessage')) {\"message\" :\"$errorMessageObj.message\"}"
}

##########################################################
# Methodes section (Response)
##########################################################

resource "aws_api_gateway_method_response" "getall_200" {
  provider    = aws.current
  rest_api_id = "${aws_api_gateway_rest_api.movies.id}"
  resource_id = "${aws_api_gateway_resource.getall.id}"
  http_method = "${aws_api_gateway_method.movies_getall.http_method}"
  status_code = "200"
  response_models = { "application/json" = "Empty" }
  #response_parameters = { "method.response.header.Access-Control-Allow-Origin" = "\'*\'" }
}

resource "aws_api_gateway_method_response" "getall_400" {
  provider    = aws.current
  rest_api_id = "${aws_api_gateway_rest_api.movies.id}"
  resource_id = "${aws_api_gateway_resource.getall.id}"
  http_method = "${aws_api_gateway_method.movies_getall.http_method}"
  status_code = "400"
  response_models = { "application/json" = "Error" }
  #response_parameters = {"method.response.header.Access-Control-Allow-Origin" = "\'*\'" }
}

resource "aws_api_gateway_method_response" "getbyid_200" {
  provider    = aws.current
  rest_api_id = "${aws_api_gateway_rest_api.movies.id}"
  resource_id = "${aws_api_gateway_resource.getbyid_id.id}"
  http_method = "${aws_api_gateway_method.movies_getbyid.http_method}"
  status_code = "200"
  response_models = { "application/json" = "Empty" }
  #response_parameters = { "method.response.header.Access-Control-Allow-Origin" = "\'*\'" }
}

resource "aws_api_gateway_method_response" "getbyid_400" {
  provider    = aws.current
  rest_api_id = "${aws_api_gateway_rest_api.movies.id}"
  resource_id = "${aws_api_gateway_resource.getbyid_id.id}"
  http_method = "${aws_api_gateway_method.movies_getbyid.http_method}"
  status_code = "400"
  response_models = { "application/json" = "Error" }
  #response_parameters = {"method.response.header.Access-Control-Allow-Origin" = "\'*\'" }
}

##########################################################
# Request Validators
##########################################################

resource "aws_api_gateway_request_validator" "all" {
  provider      = aws.current
  name = "validate_body_and_parameters"
  rest_api_id = "${aws_api_gateway_rest_api.movies.id}"
  validate_request_body = true
  validate_request_parameters = true
}

resource "aws_api_gateway_request_validator" "parameters" {
  provider      = aws.current
  name = "validate_parameters"
  rest_api_id = "${aws_api_gateway_rest_api.movies.id}"
  validate_request_body = false
  validate_request_parameters = true
}

resource "aws_api_gateway_request_validator" "body" {
  provider      = aws.current
  name = "validate_body"
  rest_api_id = "${aws_api_gateway_rest_api.movies.id}"
  validate_request_body = true
  validate_request_parameters = false
}

