resource "aws_nat_gateway" "to-world" {
  count         = "${length(var.azs)}"
  allocation_id = "${element(aws_eip.to-world.*.id, count.index)}"
  subnet_id     = "${element(aws_subnet.reverse-proxy-public.*.id, count.index)}"
}
