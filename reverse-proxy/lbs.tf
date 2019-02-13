/* 
 * Reverse Proxy 1, 2 and 3 are designed to have a single load balancer that has
 * a elastic IP (EIP) for each availability zone (AZ).  It would have been
 * simpler to put a count on the load balancer to create multiple load
 * balancers, one per AZ.  Unfoturnately, Java typically only resolves the first
 * IP address for a DNS entry.  By using a single load balancer, the traffic
 * will still be routed to all AZs when Java is using a single IP. 
 */
resource "aws_lb" "reverse-proxy-1" {
  count = "${replace(replace(length(data.aws_subnet.reverse-proxy-public.*.id), "/^[^1].*/", "0"), 
             "/^1$/", "1")}"

  name               = "${var.app-name}-reverse-proxy"
  internal           = false
  load_balancer_type = "network"

  subnet_mapping {
    allocation_id = "${aws_eip.reverse-proxy.0.id}"
    subnet_id     = "${data.aws_subnet.reverse-proxy-public.0.id}"
  }

  tags {
    Name    = "${var.app-name}-reverse-proxy"
    version = "${var.version}"
  }
}

resource "aws_lb" "reverse-proxy-2" {
  count = "${replace(replace(length(data.aws_subnet.reverse-proxy-public.*.id), "/^[^2].*/", "0"), 
             "/^2$/", "1")}"

  name               = "${var.app-name}-reverse-proxy"
  internal           = false
  load_balancer_type = "network"

  subnet_mapping {
    allocation_id = "${aws_eip.reverse-proxy.0.id}"
    subnet_id     = "${data.aws_subnet.reverse-proxy-public.0.id}"
  }

  subnet_mapping {
    allocation_id = "${aws_eip.reverse-proxy.1.id}"
    subnet_id     = "${data.aws_subnet.reverse-proxy-public.1.id}"
  }

  tags {
    Name    = "${var.app-name}-reverse-proxy"
    version = "${var.version}"
  }
}

resource "aws_lb" "reverse-proxy-3" {
  count = "${replace(replace(length(data.aws_subnet.reverse-proxy-public.*.id), "/^[^3].*/", "0"), 
             "/^3$/", "1")}"

  name               = "${var.app-name}-reverse-proxy"
  internal           = false
  load_balancer_type = "network"

  subnet_mapping {
    allocation_id = "${aws_eip.reverse-proxy.0.id}"
    subnet_id     = "${data.aws_subnet.reverse-proxy-public.0.id}"
  }

  subnet_mapping {
    allocation_id = "${aws_eip.reverse-proxy.1.id}"
    subnet_id     = "${data.aws_subnet.reverse-proxy-public.1.id}"
  }

  subnet_mapping {
    allocation_id = "${aws_eip.reverse-proxy.2.id}"
    subnet_id     = "${data.aws_subnet.reverse-proxy-public.2.id}"
  }

  tags {
    Name    = "${var.app-name}-reverse-proxy"
    version = "${var.version}"
  }
}

resource "aws_lb_target_group" "reverse-proxy" {
  name     = "${var.app-name}-reverse-proxy"
  port     = 80
  protocol = "TCP"
  vpc_id   = "${data.aws_vpc.reverse-proxy.id}"

  target_type = "instance"

  health_check {
    protocol = "HTTP"
    port     = 80
    path     = "/index.html"
  }

  tags {
    Name    = "${var.app-name}-reverse-proxy"
    version = "${var.version}"
  }
}

resource "aws_lb_listener" "reverse-proxy" {
  load_balancer_arn = "${element(concat(aws_lb.reverse-proxy-1.*.arn, aws_lb.reverse-proxy-2.*.arn, aws_lb.reverse-proxy-3.*.arn),0)}"

  port     = "80"
  protocol = "TCP"

  default_action {
    type             = "forward"
    target_group_arn = "${aws_lb_target_group.reverse-proxy.arn}"
  }
}
