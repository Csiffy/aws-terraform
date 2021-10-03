

resource "aws_api_gateway_deployment" "movies" {
  provider    = aws.current
  depends_on  = ["aws_api_gateway_method.movies_get"]

  rest_api_id = "${aws_api_gateway_rest_api.movies.id}"
  stage_name  = "dev"

  variables   = {
    "answer"  = "42"
  }
}

resource "aws_api_gateway_api_key" "MyDemoApiKey" {
  provider    = aws.current
  name = "demo_key"

  stage_key {
    rest_api_id = "${aws_api_gateway_rest_api.movies.id}"
    stage_name  = "${aws_api_gateway_deployment.MyDemoDeployment.stage_name}"
  }
}

resource "aws_api_gateway_base_path_mapping" "test" {
  provider    = aws.current
  api_id      = "${aws_api_gateway_rest_api.MyDemoAPI.id}"
  stage_name  = "${aws_api_gateway_deployment.example.stage_name}"
  domain_name = "${aws_api_gateway_domain_name.example.domain_name}"
}

