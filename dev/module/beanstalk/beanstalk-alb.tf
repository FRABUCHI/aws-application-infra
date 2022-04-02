resource "aws_lb" "sample_api_server_alb" {
  name               = "awseb-AWSEB-1QQAOY8O6EO22"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [sg-06fa579679e49e4fc]
  subnets            = ["${module.global_variables.this_network.outputs.this_pub_sbnt_a_id}","${module.global_variables.this_network.outputs.this_pub_sbnt_c_id}"]

  enable_deletion_protection = true

  tags = {
    Environment = "dev"
  }
}