resource "aws_subnet" "reverse-proxy-public" {
  vpc_id = "${data.aws_vpc.reverse-proxy.id}"

  count = "${length(var.azs)}"

  cidr_block = "${cidrsubnet(data.aws_vpc.reverse-proxy.cidr_block, 4, count.index)}"

  map_public_ip_on_launch = true

  availability_zone = "${element(var.azs, count.index)}"

  tags {
    Name = "${var.app-name}-reverse-proxy-public-${count.index}"
  }
}

resource "aws_subnet" "reverse-proxy" {
  vpc_id = "${data.aws_vpc.reverse-proxy.id}"

  count = "${length(var.azs)}"

  cidr_block = "${cidrsubnet(data.aws_vpc.reverse-proxy.cidr_block, 4, count.index + length(var.azs))}"

  availability_zone = "${element(var.azs, count.index)}"

  tags {
    Name = "${var.app-name}-reverse-proxy-${count.index}"
  }
}
