output "this_network" {
	value = "${data.terraform_remote_state.network}"
}

output "this_aws_account" {
	value = "${var.aws_account}"
}

output "this_aws_region" {
	value = "${var.aws_region}"
}
