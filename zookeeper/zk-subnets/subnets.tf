resource "aws_subnet" "zookeeper" {
  vpc_id = "${data.aws_vpc.zookeeper.id}"

  count = "${length(var.azs)}"

  cidr_block = "${cidrsubnet(data.aws_vpc.zookeeper.cidr_block, 2, count.index)}"

  map_public_ip_on_launch = true

  availability_zone = "${element(var.azs, count.index)}"

  tags = "${merge(var.tags, map("Name", "zookeeper-${count.index}"))}"
}
