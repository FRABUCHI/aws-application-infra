resource "aws_elastic_beanstalk_environment" "docker" {
  name                = "docker"
  application         = aws_elastic_beanstalk_application.sample_api_server.name
  solution_stack_name = "64bit Amazon Linux 2 v3.4.12 running Docker"

  setting {
    namespace = "aws:ec2:vpc"
    name      = "VPCId"
    value     = "${module.global_variables.this_network.outputs.this_vpc_id}"
  }

  setting {
    namespace = "aws:ec2:vpc"
    name      = "Subnets"
    value     = "${module.global_variables.this_network.outputs.this_pri_sbnt_a_id}"
  }

  setting {
    namespace = "aws:ec2:vpc"
    name      = "Subnets"
    value     = "${module.global_variables.this_network.outputs.this_pri_sbnt_c_id}"
  }
}