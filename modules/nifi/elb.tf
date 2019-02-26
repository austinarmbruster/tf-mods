resource "aws_elb" "nifi-elb" {
  name            = "nifi-elb"
  security_groups = ["${aws_security_group.nifi.id}"]
  subnets         = ["${aws_subnet.nifi.*.id}"]

  listener {
    instance_port     = 8080
    instance_protocol = "tcp"
    lb_port           = 8080
    lb_protocol       = "tcp"
  }

  listener {
    instance_port     = 4444
    instance_protocol = "tcp"
    lb_port           = 4444
    lb_protocol       = "tcp"
  }

  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 3
    target              = "HTTP:8080/"
    interval            = 10
  }

  cross_zone_load_balancing   = true
  idle_timeout                = 400
  connection_draining         = true
  connection_draining_timeout = 400

  tags {
    Name = "nifi-elb"
  }
}
