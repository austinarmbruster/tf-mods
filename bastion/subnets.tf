resource "aws_subnet" "bastion" {
  vpc_id = "${var.vpc-id}"

  count = "${length(var.azs)}"

  cidr_block = "${element(var.subnet-cidrs, count.index)}"

  map_public_ip_on_launch = true

  availability_zone = "${element(var.azs, count.index)}"

  tags {
    Name = "bastion-${count.index}"
  }
}
