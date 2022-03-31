resource "aws_iam_policy" "sample_api_server_ecr_access_policy" {
  name        = "sample_api_server_ecr_access_policy"
  path        = "/"
  description = "sample_api_server_ecr_access_policy"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid = "AllowEbAuth"
        Action = [
          "ecr:GetAuthorizationToken",
        ]
        Effect   = "Allow"
        Resource = "*"
      },
      {
        Sid = "AllowPull",
        Effect = "Allow",
        Resource = [
          "arn:aws:ecr:${module.global_variables.this_aws_region}:${module.global_variables.this_aws_account}:repository/${var.repo_name}"
        ],
        Action = [
          "ecr:GetAuthorizationToken",
          "ecr:BatchCheckLayerAvailability",
          "ecr:GetDownloadUrlForLayer",
          "ecr:GetRepositoryPolicy",
          "ecr:DescribeRepositories",
          "ecr:ListImages",
          "ecr:BatchGetImage"
        ]
      }
    ]
  })
}