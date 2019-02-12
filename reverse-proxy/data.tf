data "aws_vpc" "reverse-proxy" {
  filter {
    name   = "tag:${var.vpc-tag}"
    values = [true]
  }
}

data "aws_internet_gateway" "from-world" {
  filter {
    name   = "attachment.vpc-id"
    values = ["${data.aws_vpc.reverse-proxy.id}"]
  }
}
