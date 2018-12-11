resource "aws_subnet" "nifi" {
  vpc_id = "${data.aws_vpc.nifi.id}"

  count = "${length(var.azs)}"

  cidr_block = "${cidrsubnet(data.aws_vpc.nifi.cidr_block, 2, count.index)}"

  map_public_ip_on_launch = true

  availability_zone = "${element(var.azs, count.index)}"

  tags {
    Name = "nifi-${count.index}"
  }
}
