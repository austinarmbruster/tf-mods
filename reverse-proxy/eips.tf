resource "aws_eip" "reverse-proxy" {
  count = "${length(data.aws_subnet.reverse-proxy-public.*.id)}"
  vpc   = true
}
