resource "aws_elastic_beanstalk_application" "sample_api_server" {
  name        = "${module.global_variables.this_env}-${var.app_name}"
  description = "sample-api-server"
}