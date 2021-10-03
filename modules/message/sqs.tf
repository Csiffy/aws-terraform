
resource "aws_sqs_queue" "this" {
  provider = aws.current
  name     = "${var.name}-sqs-queue"
}

resource "aws_sqs_queue_policy" "test" {
  provider  = aws.current
  queue_url = "${aws_sqs_queue.this.id}"

  policy    = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "AWS": "*"
      },
      "Action": "SQS:SendMessage",
      "Resource": "${aws_sqs_queue.this.arn}",
      "Condition": {
        "ArnEquals": {
          "aws:SourceArn": "${aws_sns_topic.this.arn}"
        }
      }
    }
  ]
}
POLICY
}

