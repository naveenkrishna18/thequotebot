module bot_lambda_function {
    source = "./aws-modules/Lambda"
    lambda_role_name = "demo-lambda-role-bot"
    lambda_policy_name = "demo-lambda-policy-bot"
    lambda_policy_attachment_name = "attach-demo-lambda-policy-bot"
    lambda_function_name = "demo-lambda-bot"
    source_file = "../lambda/lambda_scripts/bot_lambda_handler.py"
    output_path = "../lambda/lambda_scripts/bot_lambda_handler.zip"
    lambda_layer_file_name = "../lambda/lambda_layers/tweepy.zip"
    lambda_layer_name = "tweepy"
    compatible_runtimes = ["python3.6","python3.7","python3.8","python3.9"]
    compatible_architectures = ["x86_64","arm64"]
}
    
