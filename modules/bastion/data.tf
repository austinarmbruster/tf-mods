data "aws_vpc" "bastion" {
  filter {
    name   = "tag:${var.vpc-tag}"
    values = [true]
  }
}
