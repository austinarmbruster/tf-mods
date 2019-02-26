data "aws_vpc" "zookeeper" {
  filter {
    name   = "tag:${var.vpc-tag}"
    values = [true]
  }
}
