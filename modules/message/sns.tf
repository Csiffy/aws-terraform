
resource "aws_sns_topic" "this" {
  provider     = aws.current
  name         = "${var.name}-sns-topic"
  display_name = "${var.name}-sns-topic-display"
}

resource "aws_sns_topic_policy" "default" {
  provider = aws.current
  arn      = "${aws_sns_topic.this.arn}"
  policy   = "${data.aws_iam_policy_document.sns-topic-policy.json}"
}

data "aws_iam_policy_document" "sns-topic-policy" {
  provider     = aws.current
  statement {
    actions = [
      "SNS:Subscribe",
      "SNS:SetTopicAttributes",
      "SNS:RemovePermission",
      "SNS:Receive",
      "SNS:Publish",
      "SNS:ListSubscriptionsByTopic",
      "SNS:GetTopicAttributes",
      "SNS:DeleteTopic",
      "SNS:AddPermission",
    ]
    effect = "Allow"
    principals {
      type        = "AWS"
      identifiers = ["*"]
    }
    resources = [
      "${aws_sns_topic.this.arn}",
    ]
  }
}

resource "aws_sns_topic_subscription" "sns-topic" {
  provider  = aws.current
  topic_arn = "${aws_sns_topic.this.arn}"
  protocol  = "sqs"
  #protocol = "lambda"
  endpoint  = "${aws_sqs_queue.this.arn}"
  #raw_message_delivery = true
}


/*
resource "aws_s3_bucket_notification" "img_upload_bucket_notification" {
  provider = aws.current
  bucket   = "${var.s3_bucket}"

  topic {
    topic_arn     = "${aws_sns_topic.this.arn}"
    events        = ["s3:ObjectCreated:*"]
    filter_suffix = ".jpg"
  }
}
*/

