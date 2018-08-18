
resource "aws_api_gateway_rest_api" "movies" {
  provider    = "aws.current"
  name        = "movies"
  description = "This is the API of movie database"
}



