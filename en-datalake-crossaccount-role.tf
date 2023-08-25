# resource "aws_iam_policy" "KMS_policy" {
#   name        = "en-datalake-prod-es2020-full-load-processed-etl-kms-policy"
#   description = "Policy for KMS"
# policy = jsonencode({
#    Version = "2012-10-17"
#     Statement = [
#         {
#           "Effect": "Allow",
#           "Action": [
#                "kms:Decrypt"
#           ],
#           "Resource": [
#                "arn:aws:kms:ap-northeast-1:833361277653:key/0b5947ff-a6a4-4cef-ac44-2503aeb256b1"
#           ]
#         }
#     ]

# })
# }

# resource "aws_iam_policy" "S3_policy" {
#   name   = "en-datalake-prod-es2020-full-load-processed-etl-s3-policy"
#   description = "Raw Bucket policy"

#   policy = jsonencode({
#    "Version": "2012-10-17",
#     "Statement": [
#         {
#           "Effect": "Allow",
#           "Action": [
#                "s3:GetObject",
#                "s3:PutObject",
#                "s3:List*"
#           ],
#           "Resource": [
#               "arn:aws:s3:::en-datalake-dev-raw-data-723621421724-ap-northeast-1/*",
#               ]
#         }
#     ]
# })
# }

# resource "aws_iam_role" "GlueJob_role" {
#   name = "en-datalake-prod-es2020-full-load-processed-etl-role"

#    assume_role_policy = jsonencode({
#   "Version": "2012-10-17",
#   "Statement": [
#     {
#       "Effect": "Allow",
#       "Principal": {
#         "Service": "glue.amazonaws.com"
#       },
#       "Action": "sts:AssumeRole"
#     }
#   ]
# })
# }


# resource "aws_iam_policy_attachment" "KMS_policy_attachment" {
#   policy_arn = aws_iam_policy.KMS_policy.arn
#   name =  "KMS-policy-attachment"
#   roles      = [aws_iam_role.GlueJob_role.name]
# }


# resource "aws_iam_policy_attachment" "S3_policy_attachment" {
#   policy_arn = aws_iam_policy.S3_policy.arn
#   name = "S3-policy-attachment"
#   roles      = [aws_iam_role.GlueJob_role.name]
# }

# resource "aws_iam_role" "Lambdacustom_role" {
#   name = "en-datalake-FFI-Lambda-Pipeline-Rule-Role"

#   assume_role_policy = jsonencode({
#     Version = "2012-10-17"
#     Statement = {
#       Effect = "Allow"
#       Principal = {
#          Service = "lambda.amazonaws.com"
#        }
#        Action = "sts:AssumeRole"
#     }
# })
# }
# resource "aws_iam_policy" "Lambdacustom_policy" {
#   name        = "en-datalake-FFI-Lambda-Pipeline-Custom-Policy"
#   description = "Custom policy for specific actions"

#   policy = jsonencode({
#   Version = "2012-10-17"
#   Statement = [
#       {
#         Sid = "VisualEditor0",
#         Effect   = "Allow"
#         Action   = [
#           "iam:GetRole",
#           "apigateway:*",
#           "iam:AttachRolePolicy",
#           "iam:PutRolePolicy",
#           "cloudformation:CreateChangeSet",
#           "s3:GetBucketVersioning",
#           "codedeploy:*",
#           "lambda:*",
#           "s3:GetObjectVersion",
#           "iam:PassRole"
#         ]
#         Resource = "*"
#       }
#       //
#     ]
#   })
# }

# resource "aws_iam_role_policy_attachment" "Lambdacustom_policy_attachment" {
#   policy_arn = aws_iam_policy.Lambdacustom_policy.arn
#   role       = aws_iam_role.Lambdacustom_role.name
# }
