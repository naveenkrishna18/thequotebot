variable lambda_role_name {
  type        = string
  description = "lambda role name"
}

variable lambda_policy_name {
  type        = string
  description = "lambda policy name"
}

variable lambda_policy_attachment_name {
  type        = string
  description = "attach policy to lambda function"
}

variable lambda_function_name {
  type        = string
  description = "name of the lambda function"
}

variable source_file {
  type        = string
  description = "lambda code path"
}

variable output_path {
  type        = string
  description = "lambda code output path"
}

variable lambda_layer_file_name {
  type        = string
  description = "lambda layer file name"
}

variable lambda_layer_name {
  type        = string
  description = "lambda layer name"
}

variable compatible_runtimes {
  type        = list
  description = "compatible runtimes"
}

variable compatible_architectures {
  type        = list
  description = "compatible architecture"
}




