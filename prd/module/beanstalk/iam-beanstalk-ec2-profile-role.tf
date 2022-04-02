resource "aws_iam_role" "beanstalk_ec2_profile" {
  name = "${module.global_variables.this_env}-${var.app_name}-beanstalk-ec2-profile-role"
  
  assume_role_policy = jsonencode({
    Version = "2008-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      },
    ]
  })
}

resource "aws_iam_role_policy_attachment" "AWSElasticBeanstalkWebTier" {
  role       = aws_iam_role.beanstalk_ec2_profile.name
  policy_arn = "arn:aws:iam::aws:policy/AWSElasticBeanstalkWebTier"
}

resource "aws_iam_role_policy_attachment" "AWSElasticBeanstalkMulticontainerDocker" {
  role       = aws_iam_role.beanstalk_ec2_profile.name
  policy_arn = "arn:aws:iam::aws:policy/AWSElasticBeanstalkMulticontainerDocker"
}

resource "aws_iam_role_policy_attachment" "AWSElasticBeanstalkWorkerTier" {
  role       = aws_iam_role.beanstalk_ec2_profile.name
  policy_arn = "arn:aws:iam::aws:policy/AWSElasticBeanstalkWorkerTier"
}
