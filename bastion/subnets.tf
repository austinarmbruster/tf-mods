resource "aws_subnet" "bastion" {
  vpc_id = "${data.aws_vpc.bastion.id}"

  count = "${length(var.azs)}"

  cidr_block = "${cidrsubnet(data.aws_vpc.bastion.cidr_block, 2, count.index)}"

  map_public_ip_on_launch = true

  availability_zone = "${element(var.azs, count.index)}"

  tags {
    Name = "bastion-${count.index}"
  }
}
