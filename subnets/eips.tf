resource "aws_eip" "to-world" {
  count = "${length(var.azs)}"
  vpc   = true
}
