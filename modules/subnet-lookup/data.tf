// Finds the VPC
data "aws_vpc" "subnet-lookup" {
  filter {
    name   = "tag:${var.vpc-tag}"
    values = [true]
  }
}

// Finds the subnet IDs that were requested.
data "aws_subnet_ids" "subnet-lookup" {
  vpc_id = "${data.aws_vpc.subnet-lookup.id}"
  tags   = "${var.tags}"
}

locals {
  // Make it easier to handle the list of IDs.
  subnet-ids = "${flatten(data.aws_subnet_ids.subnet-lookup.*.ids)}"
}

// Finds the full subnet references.
data "aws_subnet" "subnet-lookup" {
  count = "${length(local.subnet-ids)}"

  id = "${local.subnet-ids[count.index]}"
}
