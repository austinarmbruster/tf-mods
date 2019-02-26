resource "aws_lb" "simple-http-server" {
  name               = "${var.app-name}-simple-http-server"
  internal           = true
  load_balancer_type = "network"

  subnets = ["${data.aws_subnet.simple-http-server.*.id}"]

  tags = "${map("Name", "${var.app-name}-simple-http-server", "version", var.version, var.app-name, true)}"
}

resource "aws_lb_target_group" "simple-http-server" {
  name     = "${var.app-name}-simple-http-server"
  port     = 80
  protocol = "TCP"
  vpc_id   = "${data.aws_vpc.simple-http-server.id}"

  target_type = "instance"

  health_check {
    protocol = "HTTP"
    port     = 80
    path     = "/index.html"
  }

  tags = "${map("Name", "${var.app-name}-simple-http-server", "version", var.version, var.app-name, true)}"
}

resource "aws_lb_listener" "simple-http-server" {
  load_balancer_arn = "${aws_lb.simple-http-server.arn}"

  port     = "80"
  protocol = "TCP"

  default_action {
    type             = "forward"
    target_group_arn = "${aws_lb_target_group.simple-http-server.arn}"
  }
}
