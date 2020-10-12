// ************************ NOTE ***************************
// Terraform AWS provider has not yet implemented the EventBridge resources.
// But, as the CloudWatch Event is a subset of EventBridge, we can use use
// Cloudwatch Events because we are using the default event bus and are not
// using any third party SaaS application for this demonstration.

resource "aws_cloudwatch_event_rule" "event_rule" {
  name          = "${local.resource_name_prefix}-LambdaToLambdaEventDrivenRule"
  description   = "Sends events to target lambda."
  event_pattern = <<PATTERN
{
	"source": [
		"learn.eventbridge"
	],
	"detail-type": [
		"Learning Eventbridge"
	]
}
PATTERN
}

resource "aws_cloudwatch_event_target" "event_target" {
  target_id = "EventBridgeToLambdaInvoke"
  rule      = aws_cloudwatch_event_rule.event_rule.name
  arn       = aws_lambda_function.event_receiver_lambda.arn
}
