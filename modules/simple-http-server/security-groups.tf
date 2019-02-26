resource "aws_security_group" "simple-http-server" {
  name        = "${var.app-name}-simple-http-server"
  description = "Simple HTTP Server: HTTP"

  vpc_id = "${data.aws_vpc.simple-http-server.id}"

  ingress {
    from_port   = "${var.simple-http-server-service-port}"
    to_port     = "${var.simple-http-server-service-port}"
    protocol    = "tcp"
    cidr_blocks = ["${data.aws_subnet.simple-http-server.*.cidr_block}"]
  }

  ingress {
    from_port   = "${var.simple-http-server-health-check-port}"
    to_port     = "${var.simple-http-server-health-check-port}"
    protocol    = "tcp"
    cidr_blocks = ["${data.aws_subnet.simple-http-server.*.cidr_block}"]
  }

  egress {
    from_port   = "0"
    to_port     = "0"
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = "${map("Name", "${var.app-name}-simple-http-server", "version", var.version, var.app-name, true)}"
}
