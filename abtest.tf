# resource "aws_iam_role" "ABTesting_Developer_role" {
#   name = "FFIABTestDeveloperSwitchRole"  

# assume_role_policy = jsonencode({
#     Version = "2012-10-17"
#     Statement = [
#       {
#         Effect = "Allow"
#         Principal = {
#           AWS = "arn:aws:iam::483777660534:root" ,
#         }
#         Action = "sts:AssumeRole"
#         "Condition": {
#                 "StringEquals": {
#                     "sts:RoleSessionName": "{aws:username}"
#                 },
#                 "Bool": {
#                     "aws:MultiFactorAuthPresent": "true"
#                 }
#       }
#       }
#     ]
#   })
# }


# resource "aws_iam_policy" "restrict_delete_policy" {
#   name        = "ABTesting_Developer_custom_policy"
#   description = "Policy to some of the resources and restrict delete actions"
#   policy = jsonencode({
#     Version = "2012-10-17",
#     Statement = [
#       {
#         Effect   = "Allow",
#         Action   = [
#           "s3:*",
#           "lambda:*",
#           "dynamodb:*",
#           "apigateway:*",
#           "codepipeline:*",
#           "codebuild:*",
#           "codecommit:*",
#           "cloudformation:*",
#           "cloudwatch:*",
#           "sns:*",
#           "Sqs:*"
#         ],
#         Resource = "*",
#       },
#       {
#         Effect   = "Allow",
#         Action   = "s3:*",
#         Resource = "*",
#       },
#       {
#         Effect   = "Deny",
#         Action   = "dynamodb:DeleteItem",
#         Resource = "*",
#       },
#     ],
#   })
# }

# resource "aws_iam_role_policy_attachment" "custom_policy_attachment" {
#   policy_arn = aws_iam_policy.restrict_delete_policy.arn
#   role       = aws_iam_role.ABTesting_Developer_role.name
# }

# resource "aws_iam_role_policy_attachment" "s3_attachment" {
#   policy_arn = "arn:aws:iam::aws:policy/AmazonS3FullAccess"  
#   role       = aws_iam_role.ABTesting_Developer_role.name
# }

# resource "aws_iam_role_policy_attachment" "lambda_attachment" {
#   policy_arn = "arn:aws:iam::aws:policy/AWSLambda_FullAccess" 
#   role       = aws_iam_role.ABTesting_Developer_role.name
# }

# resource "aws_iam_role_policy_attachment" "dynamodb_attachment" {
#   policy_arn = "arn:aws:iam::aws:policy/AmazonDynamoDBFullAccess" 
#   role       = aws_iam_role.ABTesting_Developer_role.name
# }

# resource "aws_iam_role_policy_attachment" "apigateway_attachment" {
#   policy_arn = "arn:aws:iam::aws:policy/AmazonAPIGatewayAdministrator"  
#   role       = aws_iam_role.ABTesting_Developer_role.name
# }
# resource "aws_iam_role_policy_attachment" "codepipeline_attachment" {
#   policy_arn = "arn:aws:iam::aws:policy/AWSDataPipeline_FullAccess"  
#   role       = aws_iam_role.ABTesting_Developer_role.name
# }

# resource "aws_iam_role_policy_attachment" "codebuild_attachment" {
#   policy_arn = "arn:aws:iam::aws:policy/AWSCodeBuildAdminAccess"  
#   role       = aws_iam_role.ABTesting_Developer_role.name
# }

# resource "aws_iam_role_policy_attachment" "codecommit_attachment" {
#   policy_arn = "arn:aws:iam::aws:policy/AWSCodeCommitFullAccess"  
#   role       = aws_iam_role.ABTesting_Developer_role.name
# }
# resource "aws_iam_role_policy_attachment" "cloudformation_attachment" {
#   policy_arn = "arn:aws:iam::aws:policy/AWSCloudFormationFullAccess" 
#   role       = aws_iam_role.ABTesting_Developer_role.name
# }
# resource "aws_iam_role_policy_attachment" "cloudwatch_attachment" {
#   policy_arn = "arn:aws:iam::aws:policy/CloudWatchFullAccess" 
#   role       = aws_iam_role.ABTesting_Developer_role.name
# }

# resource "aws_iam_role_policy_attachment" "snsfull_attachment" {
#   policy_arn = "arn:aws:iam::aws:policy/AmazonSNSFullAccess"
#   role       = aws_iam_role.ABTesting_Developer_role.name
# }

