resource "aws_subnet" "common-subnets-public" {
  vpc_id = "${data.aws_vpc.common-subnets.id}"

  count = "${length(var.azs)}"

  cidr_block = "${cidrsubnet(data.aws_vpc.common-subnets.cidr_block, var.subnet-bits, var.subnet-netnum-offset + count.index)}"

  map_public_ip_on_launch = true

  availability_zone = "${element(var.azs, count.index)}"

  tags = "${merge(var.tags,
    map("${var.app-name}", true, "public", true, "Name", "${var.app-name}-public-${count.index}", "version", "${var.version}"))}"
}

resource "aws_subnet" "common-subnets" {
  vpc_id = "${data.aws_vpc.common-subnets.id}"

  count = "${length(var.azs)}"

  // start the private subnets right after the block of public subnets
  cidr_block = "${cidrsubnet(data.aws_vpc.common-subnets.cidr_block, var.subnet-bits, var.subnet-netnum-offset + length(var.azs) + count.index)}"

  availability_zone = "${element(var.azs, count.index)}"

  tags = "${merge(var.tags,
    map("${var.app-name}", true, "private", true, "Name", "${var.app-name}-${count.index}", "version", "${var.version}"))}"
}
