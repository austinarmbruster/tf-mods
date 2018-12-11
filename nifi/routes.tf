data "aws_route_table" "from-world" {
  filter {
    name   = "tag:Name"
    values = ["world-to-app"]
  }
}

resource "aws_route_table_association" "bastion-a-public" {
  count          = "${length(var.azs)}"
  subnet_id      = "${element(aws_subnet.nifi.*.id, count.index)}"
  route_table_id = "${data.aws_route_table.from-world.id}"
}
