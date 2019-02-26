resource "aws_eip" "reverse-proxy" {
  count = "${length(var.public-subnet-ids)}"

  vpc  = true
  tags = "${merge(var.tags,
    map("${var.app-name}", true, "Name", "${var.app-name}-reverse-proxy-${count.index}", "version", "${var.version}"))}"
}
