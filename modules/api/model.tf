

resource "aws_api_gateway_model" "getbyid_input" {
  provider     = "aws.current"
  rest_api_id  = "${aws_api_gateway_rest_api.movies.id}"
  name         = "GetByIdInput"
  description  = "Get a specific movies by id"
  content_type = "application/json"

  schema = <<EOF
{
    "type":"object",
    "properties":{
        "id":{"type":"number"}
    },
    "title":"getbyid_input"
}
EOF
}

resource "aws_api_gateway_model" "getbyid_output" {
  provider     = "aws.current"
  rest_api_id  = "${aws_api_gateway_rest_api.movies.id}"
  name         = "GetByIdOutput"
  description  = "Get a specific movies by id"
  content_type = "application/json"

  schema = <<EOF
{
    "type":"object",
    "properties":{
        "id":{"type":"number"}
    },
    "title":"getbyid_output"
}
EOF
}

