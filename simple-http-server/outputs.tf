output "simple-http-server-lb" {
  value = "${aws_lb.simple-http-server.dns_name}"
}
