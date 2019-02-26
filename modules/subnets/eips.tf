resource "aws_eip" "to-world" {
  count = "${length(var.azs)}"
  vpc   = true
  tags = "${merge(var.tags,
    map("${var.app-name}", true, "Name", "${var.app-name}-to-world-${count.index}", "version", "${var.version}"))}"
}
