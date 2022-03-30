terraform {
	backend "s3" {
		bucket = "sample-api-server-tf-state"
		key = "application.tfstate"
		region = "${var.aws_region}"
		encrypt = true
	}
}
