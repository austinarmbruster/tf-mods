data "aws_vpc" "simple-http-server" {
  filter {
    name   = "tag:${var.vpc-tag}"
    values = [true]
  }
}

data "aws_subnet" "simple-http-server" {
  count = "${length(var.subnet-ids)}"

  id = "${var.subnet-ids[count.index]}"
}
