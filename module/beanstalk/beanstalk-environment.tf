resource "aws_elastic_beanstalk_environment" "Sample_api_server_env" {
  name                = "Sample-api-server-env"
  application         = aws_elastic_beanstalk_application.sample_api_server.name
  solution_stack_name = "64bit Amazon Linux 2 v3.4.12 running Docker"
  setting {
    namespace = "aws:ec2:vpc"
    name      = "VPCId"
    value     = "${module.global_variables.this_network.outputs.this_vpc_id}"
  }
  setting {
    namespace = "aws:ec2:vpc"
    name      = "AssociatePublicIpAddress"
    value     = "false"
  }

  setting {
    namespace = "aws:ec2:vpc"
    name      = "ELBScheme"
    value     = "public"
  }

  setting {
    namespace = "aws:ec2:vpc"
    name      = "ELBSubnets"
    value     = "${module.global_variables.this_network.outputs.this_pub_sbnt_a_id},${module.global_variables.this_network.outputs.this_pub_sbnt_c_id}"
  }

  setting {
    namespace = "aws:ec2:vpc"
    name      = "Subnets"
    value     = "${module.global_variables.this_network.outputs.this_pri_sbnt_a_id},${module.global_variables.this_network.outputs.this_pri_sbnt_c_id}"
  }

  setting {
    namespace = "aws:ec2:vpc"
    name      = "DBSubnets"
    value     = "${module.global_variables.this_network.outputs.this_db_sbnt_a_id},${module.global_variables.this_network.outputs.this_db_sbnt_c_id}"
  }

  setting {
      namespace = "aws:elasticbeanstalk:environment"
      name = "EnvironmentType"
      value = "LoadBalanced"
  }

  setting {
      namespace = "aws:elasticbeanstalk:environment"
      name = "LoadBalancerType"
      value = "application"
  }

  setting {
      namespace = "aws:elasticbeanstalk:environment"
      name = "ServiceRole"
      value = aws_iam_role.beanstalk_service.name
  }

  setting {
      namespace = "aws:elasticbeanstalk:managedactions"
      name = "ServiceRoleForManagedUpdates"
      value = aws_iam_role.beanstalk_service.name
  }

  setting {
      namespace = "aws:autoscaling:launchconfiguration"
      name = "IamInstanceProfile"
      value = "aws-elasticbeanstalk-ec2-role"
  }

  setting {
      namespace = "aws:autoscaling:launchconfiguration"
      name = "DisableIMDSv1"
      value = "true"
  }

  setting {
    namespace = "aws:autoscaling:launchconfiguration"
    name = "ImageId"
    value = "ami-03f79b9e7d48758b6"
  }

  setting {
    namespace = "aws:autoscaling:launchconfiguration"
    name = "InstanceType"
    value = "t2.micro, t2.small"
  }

  setting {
    namespace = "aws:autoscaling:asg"
    name = "MinSize"
    value = "2"
  }

  setting {
    namespace = "aws:autoscaling:asg"
    name = "MaxSize"
    value = "6"
  }

  setting {
    namespace = "aws:elasticbeanstalk:cloudwatch:logs"
    name = "StreamLogs"
    value = "true"
  }

  setting {
    namespace = "aws:elasticbeanstalk:cloudwatch:logs"
    name = "DeleteOnTerminate"
    value = "false"
  }

  setting {
    namespace = "aws:elasticbeanstalk:cloudwatch:logs"
    name = "RetentionInDays"
    value = "30"
  }

  setting {
    namespace = "aws:elasticbeanstalk:cloudwatch:logs:health"
    name = "HealthStreamingEnabled"
    value = "true"
  }

  setting {
    namespace = "aws:elasticbeanstalk:cloudwatch:logs:health"
    name = "DeleteOnTerminate"
    value = "false"
  }

  setting {
    namespace = "aws:elasticbeanstalk:cloudwatch:logs:health"
    name = "RetentionInDays"
    value = "30"
  }
}