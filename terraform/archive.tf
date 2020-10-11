data "archive_file" "event_putter_lambda_zip" {
  type = "zip"
  source_dir = "../lambdas/event_putter"
  output_path = "../.build/event_putter_lambda.zip"
}

data "archive_file" "event_receiver_lambda_zip" {
  type = "zip"
  source_dir = "../lambdas/event_receiver"
  output_path = "../.build/event_receiver_lambda.zip"
}

data "archive_file" "lambda_layer_zip" {
  type = "zip"
  source_dir = "../.build/package/python"
  output_path = "../.build/libraries.zip"
}
