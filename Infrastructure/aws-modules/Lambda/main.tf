resource "aws_lambda_layer_version" "this" {
  filename   = var.lambda_layer_file_name
  layer_name = var.lambda_layer_name

  compatible_runtimes = var.compatible_runtimes
  compatible_architectures = var.compatible_architectures
}

resource "aws_iam_role" "this" {
    name = var.lambda_role_name
    assume_role_policy = <<EOF
{
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Action" : "sts:AssumeRole",
        "Principal" : {
          "Service" : "lambda.amazonaws.com"
        },
        "Effect" : "Allow",
        "Sid"    : ""
      }
    ]
}
    EOF
}

resource "aws_iam_policy" "this" {
  name        = var.lambda_policy_name
  path        = "/"
  description = "AWS policy for managing aws lambda role"
  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": "*",
            "Resource": "*"
        }
    ]
}   
  EOF
}

resource "aws_iam_policy_attachment" "this" {
  name       = var.lambda_policy_attachment_name
  roles      = [aws_iam_role.this.name]
  policy_arn = aws_iam_policy.this.arn
}

data "archive_file" "zip_handler_code"{
    type = "zip"
    source_file = var.source_file
    output_path = var.output_path
}


resource "aws_lambda_function" "this" {
  filename      = var.output_path
  function_name = var.lambda_function_name
  role          = aws_iam_role.this.arn
  handler       = "test.lambda_handler"
  runtime = "python3.8"
  depends_on = [aws_iam_policy_attachment.this]
  layers = [aws_lambda_layer_version.this.arn]

}