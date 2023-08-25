provider "aws" {
	region = "ap-northeast-1"
}

# resource "aws_iam_role" "cross_account_role" {
#   name = "CrossAccountRole"

#   assume_role_policy = jsonencode({
#     Version = "2012-10-17"
#     Statement = [
#       {
#         Effect = "Allow"
#         Principal = {
#           AWS = "arn:aws:iam::176286096313:root" ,
#           "Service": ["glue.amazonaws.com", "lambda.amazonaws.com"]
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
# resource "aws_iam_role_policy_attachment" "kms_access" {
#   policy_arn = "arn:aws:iam::aws:policy/AWSKeyManagementServicePowerUser"
#   role       = aws_iam_role.cross_account_role.name
# }

# resource "aws_iam_role_policy_attachment" "athena_access" {
#   policy_arn = "arn:aws:iam::aws:policy/AmazonAthenaFullAccess"
#   role       = aws_iam_role.cross_account_role.name
# }

# resource "aws_iam_role_policy_attachment" "s3_access" {
#   policy_arn = "arn:aws:iam::aws:policy/AmazonS3FullAccess"  

#   role       = aws_iam_role.cross_account_role.name
# }

# resource "aws_iam_role_policy_attachment" "lambda_access" {
#   policy_arn = "arn:aws:iam::aws:policy/AWSLambda_FullAccess"  

#   role       = aws_iam_role.cross_account_role.name
# }

# resource "aws_iam_role_policy_attachment" "glue_access" {
#   policy_arn = "arn:aws:iam::aws:policy/service-role/AWSGlueServiceRole"  

#   role       = aws_iam_role.cross_account_role.name
# }

# resource "aws_iam_role_policy_attachment" "eventbridge_access" {
#   policy_arn = "arn:aws:iam::aws:policy/AmazonEventBridgeFullAccess"  

#   role       = aws_iam_role.cross_account_role.name
# }
