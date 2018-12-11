output "nifi-elb" {
  value = "${aws_elb.nifi-elb.dns_name}"
}
