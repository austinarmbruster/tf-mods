resource "aws_route_table" "to-world" {
  count  = "${length(var.azs)}"
  vpc_id = "${data.aws_vpc.common-subnets.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${element(aws_nat_gateway.to-world.*.id, count.index)}"
  }

  tags {
    Name    = "${var.app-name}-to-world-${count.index}"
    version = "${var.version}"
  }
}

resource "aws_route_table_association" "common-subnets" {
  count          = "${length(var.azs)}"
  subnet_id      = "${element(aws_subnet.common-subnets.*.id, count.index)}"
  route_table_id = "${element(aws_route_table.to-world.*.id, count.index)}"
}

resource "aws_route_table" "from-world" {
  vpc_id = "${data.aws_vpc.common-subnets.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${data.aws_internet_gateway.from-world.id}"
  }

  tags {
    Name    = "${var.app-name}-from-world"
    version = "${var.version}"
  }
}

resource "aws_route_table_association" "common-subnets-public" {
  count          = "${length(var.azs)}"
  subnet_id      = "${element(aws_subnet.common-subnets-public.*.id, count.index)}"
  route_table_id = "${aws_route_table.from-world.id}"
}
