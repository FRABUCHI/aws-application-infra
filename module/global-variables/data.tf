data "terraform_remote_state" "network" {
	backend = "s3"
	config = {
		bucket = "sample-api-server-tf-state"
		key = "network.tfstate"
		region = "${var.aws_region}"
		encrypt = true
	}
}
