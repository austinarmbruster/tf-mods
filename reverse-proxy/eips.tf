resource "aws_eip" "to-world" {
  count = "${length(var.azs)}"
  vpc   = true
}

resource "aws_eip" "reverse-proxy" {
  count = "${length(var.azs)}"
  vpc   = true
}
