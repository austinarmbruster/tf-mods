resource "aws_elb" "zookeeper-elb" {
  count = "${var.zookeeper-instance-count}"

  name            = "zookeeper-elb-${count.index}"
  security_groups = ["${aws_security_group.zookeeper-elb.id}"]
  subnets         = ["${data.aws_subnet_ids.zookeeper.ids}"]

  listener {
    instance_port     = 2121
    instance_protocol = "tcp"
    lb_port           = 2121
    lb_protocol       = "tcp"
  }

  listener {
    instance_port     = 2888
    instance_protocol = "tcp"
    lb_port           = 2888
    lb_protocol       = "tcp"
  }

  listener {
    instance_port     = 3888
    instance_protocol = "tcp"
    lb_port           = 3888
    lb_protocol       = "tcp"
  }

  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 3
    target              = "TCP:2121"
    interval            = 10
  }

  cross_zone_load_balancing   = true
  idle_timeout                = 400
  connection_draining         = true
  connection_draining_timeout = 400

  tags {
    Name = "zookeeper-elb-${count.index}"
  }
}
