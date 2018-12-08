resource "aws_elb" "bastion-elb" {
  name            = "bastion-elb"
  security_groups = ["${aws_security_group.bastion.id}"]
  subnets         = ["${aws_subnet.bastion.*.id}"]

  listener {
    instance_port     = 22
    instance_protocol = "tcp"
    lb_port           = 22
    lb_protocol       = "tcp"
  }

  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 3
    target              = "TCP:22"
    interval            = 10
  }

  cross_zone_load_balancing   = true
  idle_timeout                = 400
  connection_draining         = true
  connection_draining_timeout = 400

  tags {
    Name = "bastion-elb"
  }
}
