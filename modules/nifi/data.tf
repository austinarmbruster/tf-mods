data "aws_vpc" "nifi" {
  filter {
    name   = "tag:${var.vpc-tag}"
    values = [true]
  }
}
