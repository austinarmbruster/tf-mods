data "aws_vpc" "zookeeper" {
  filter {
    name   = "tag:${var.vpc-tag}"
    values = [true]
  }
}

data "aws_subnet_ids" "zookeeper" {
  vpc_id = "${data.aws_vpc.zookeeper.id}"

  filter {
    name   = "tag:${var.subnet-tag}"
    values = [true]
  }
}
