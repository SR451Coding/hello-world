resource "aws_iam_role" "Codedeploy_role" {
  name = "en-datalake-FFI-code-pipeline-lambda-deploy-rule-Role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          Service = "lambda.amazonaws.com"
        }
        Action = "sts:AssumeRole"
      }
    ]
  })
}

resource "aws_iam_policy" "Code_pipelinecustom_policy" {
  name        = "en-datalake-FFI-code-pipeline-lambda-deploy-Custom-Policy"
  description = "Custom policy for specific actions"
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Action   = ["iam:PassRole"]
      Resource = "*"
      Effect   = "Allow"

      Condition = {
        "StringEqualsIfExists" : {
          "iam:PassedToService" : [
            "cloudformation.amazonaws.com",
            "elasticbeanstalk.amazonaws.com",
            "ec2.amazonaws.com",
            "ecs-tasks.amazonaws.com"
          ]
        }
      }
      },
      {
        Action = [
          "codecommit:CancelUploadArchive",
          "codecommit:GetBranch",
          "codecommit:GetCommit",
          "codecommit:GetRepository",
          "codecommit:GetUploadArchiveStatus",
          "codecommit:UploadArchive"
        ]
        Resource = "*"
        Effect   = "Allow"
      },
      {
        Action = [
          "codedeploy:CreateDeployment",
          "codedeploy:GetApplication",
          "codedeploy:GetApplicationRevision",
          "codedeploy:GetDeployment",
          "codedeploy:GetDeploymentConfig",
          "codedeploy:RegisterApplicationRevision"
        ]

        Resource = "*"
        Effect   = "Allow"
      },
      {
        Action = [
          "codestar-connections:UseConnection"
        ]
        Resource = "*"
        Effect   = "Allow"
      },
      {
        Action = [
          "elasticbeanstalk:*",
          "ec2:*",
          "elasticloadbalancing:*",
          "autoscaling:*",
          "cloudwatch:*",
          "s3:*",
          "sns:*",
          "cloudformation:*",
          "rds:*",
          "sqs:*",
          "ecs:*"
        ]

        Resource = "*"
        Effect   = "Allow"
      },
      {
        Action = [
          "lambda:InvokeFunction",
          "lambda:ListFunctions"
        ]
        Resource = "*"
        Effect   = "Allow"
      },
      {
        Action = [
          "opsworks:CreateDeployment",
          "opsworks:DescribeApps",
          "opsworks:DescribeCommands",
          "opsworks:DescribeDeployments",
          "opsworks:DescribeInstances",
          "opsworks:DescribeStacks",
          "opsworks:UpdateApp",
          "opsworks:UpdateStack"
        ]
        Resource = "*"
        Effect   = "Allow"
      },
      {
        Action = [
          "cloudformation:CreateStack",
          "cloudformation:DeleteStack",
          "cloudformation:DescribeStacks",
          "cloudformation:UpdateStack",
          "cloudformation:CreateChangeSet",
          "cloudformation:DeleteChangeSet",
          "cloudformation:DescribeChangeSet",
          "cloudformation:ExecuteChangeSet",
          "cloudformation:SetStackPolicy",
          "cloudformation:ValidateTemplate"
        ]

        Resource = "*"

        Effect = "Allow"
      },
      {
        Action = [
          "codebuild:BatchGetBuilds",
          "codebuild:StartBuild",
          "codebuild:BatchGetBuildBatches",
          "codebuild:StartBuildBatch"
        ]
        Resource = "*",
        Effect   = "Allow"
      },
      {
        Effect = "Allow"
        Action = [
          "devicefarm:ListProjects",
          "devicefarm:ListDevicePools",
          "devicefarm:GetRun",
          "devicefarm:GetUpload",
          "devicefarm:CreateUpload",
          "devicefarm:ScheduleRun"
        ]
        Resource = "*"
      },
      {
        Effect = "Allow"
        Action = [
          "servicecatalog:ListProvisioningArtifacts",
          "servicecatalog:CreateProvisioningArtifact",
          "servicecatalog:DescribeProvisioningArtifact",
          "servicecatalog:DeleteProvisioningArtifact",
          "servicecatalog:UpdateProduct"
        ]
        Resource = "*"
      },
      {
        Effect = "Allow"
        Action = [
          "cloudformation:ValidateTemplate"
        ]
        Resource = "*"
      },
      {

        Effect = "Allow"
        Action = [
          "ecr:DescribeImages"
        ]
        Resource = "*"
      },
      {
        Effect = "Allow"
        Action = [
          "states:DescribeExecution",
          "states:DescribeStateMachine",
          "states:StartExecution"
        ]
        Resource = "*"
      },
      {

        Effect = "Allow"
        Action = [
          "appconfig:StartDeployment",
          "appconfig:StopDeployment",
          "appconfig:GetDeployment"
        ]

        Resource = "*"
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "Codepipelinecustom_policy_attachment" {
  policy_arn = aws_iam_policy.Code_pipelinecustom_policy.arn
  role       = aws_iam_role.Codedeploy_role.name
}


###hello####
