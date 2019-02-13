output "reverse-proxy-lb" {
  value = "${element(concat(aws_lb.reverse-proxy-1.*.dns_name, aws_lb.reverse-proxy-2.*.dns_name, aws_lb.reverse-proxy-3.*.dns_name),0)}"
}
