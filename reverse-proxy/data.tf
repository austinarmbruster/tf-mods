data "aws_vpc" "reverse-proxy" {
  filter {
    name   = "tag:${var.vpc-tag}"
    values = [true]
  }
}

/*
 * This module assumes that there are subnets pre-existing.  The subnets are
 * discovered from AWS and then used for this module.
 */
data "aws_subnet_ids" "reverse-proxy" {
  vpc_id = "${data.aws_vpc.reverse-proxy.id}"
  tags   = "${map("public",true, var.app-name, true)}"
}

data "aws_subnet" "reverse-proxy" {
  count = "${length(data.aws_subnet_ids.reverse-proxy.ids)}"
  id    = "${data.aws_subnet_ids.reverse-proxy.ids[count.index]}"
}

data "aws_subnet_ids" "reverse-proxy-public" {
  vpc_id = "${data.aws_vpc.reverse-proxy.id}"
  tags   = "${map("public",true, var.app-name, true)}"
}

data "aws_subnet" "reverse-proxy-public" {
  count = "${length(data.aws_subnet_ids.reverse-proxy-public.ids)}"
  id    = "${data.aws_subnet_ids.reverse-proxy-public.ids[count.index]}"
}
