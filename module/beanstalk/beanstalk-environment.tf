resource "aws_elastic_beanstalk_environment" "tfenvtest" {
  name                = "docker-linux"
  application         = aws_elastic_beanstalk_application.sample_api_server.name
  solution_stack_name = "64bit Amazon Linux 2 v3.4.12 running Docker"
}