data "aws_vpc" "reverse-proxy" {
  filter {
    name   = "tag:${var.vpc-tag}"
    values = [true]
  }
}

locals {
  agg-subnet-ids        = "${var.subnet-ids}"
  agg-public-subnet-ids = "${var.public-subnet-ids}"
}

data "aws_subnet" "reverse-proxy" {
  count = "${length(var.subnet-ids)}"

  id = "${var.subnet-ids[count.index]}"
}

data "aws_subnet_ids" "reverse-proxy-public" {
  count = "${length(var.public-subnet-ids)}"

  vpc_id = "${data.aws_vpc.reverse-proxy.id}"
  tags   = "${map("public",true, var.app-name, true)}"
}

data "aws_subnet" "reverse-proxy-public" {
  count = "${length(var.public-subnet-ids)}"

  id = "${local.agg-public-subnet-ids[count.index]}"
}
