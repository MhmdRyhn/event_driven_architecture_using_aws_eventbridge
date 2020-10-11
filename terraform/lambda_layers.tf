resource "aws_lambda_layer_version" "lambda_layer_boto3" {
  layer_name          = "boto3"
  description         = "boto3 v1.15.16"
  filename            = data.archive_file.lambda_layer_zip.output_path
  source_code_hash    = data.archive_file.lambda_layer_zip.output_base64sha256
  compatible_runtimes = [local.python_runtime]
}
