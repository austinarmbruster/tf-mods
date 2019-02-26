resource "aws_security_group" "reverse-proxy-public" {
  name        = "${var.app-name}-reverse-proxy-public"
  description = "Reverse Proxy: HTTP"

  vpc_id = "${data.aws_vpc.reverse-proxy.id}"

  ingress {
    from_port   = "${var.reverse-proxy-lb-port}"
    to_port     = "${var.reverse-proxy-lb-port}"
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = "0"
    to_port     = "0"
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags {
    Name = "${var.app-name}-reverse-proxy-public"
  }
}

resource "aws_security_group" "reverse-proxy" {
  name        = "${var.app-name}-reverse-proxy"
  description = "Reverse Proxy: HTTP"

  vpc_id = "${data.aws_vpc.reverse-proxy.id}"

  ingress {
    from_port   = "${var.reverse-proxy-service-port}"
    to_port     = "${var.reverse-proxy-service-port}"
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = "${var.reverse-proxy-health-check-port}"
    to_port     = "${var.reverse-proxy-health-check-port}"
    protocol    = "tcp"
    cidr_blocks = ["${data.aws_subnet.reverse-proxy-public.*.cidr_block}"]
  }

  egress {
    from_port   = "0"
    to_port     = "0"
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags {
    Name = "${var.app-name}-reverse-proxy"
  }
}
