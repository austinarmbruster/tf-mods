resource "aws_subnet" "bastion-a" {
  vpc_id = "${var.vpc-id}"

  #172.31.0.0/16
  cidr_block = "10.1.2.0/25"

  map_public_ip_on_launch = true

  availability_zone = "${var.az-a}"

  tags {
    Name = "bastion-a"
  }
}

resource "aws_subnet" "bastion-b" {
  vpc_id = "${var.vpc-id}"

  cidr_block = "10.1.2.128/25"

  map_public_ip_on_launch = true

  availability_zone = "${var.az-b}"

  tags {
    Name = "bastion-b"
  }
}
