resource "aws_launch_configuration" "bastion" {
  name_prefix = "bastion-"

  image_id = "${data.aws_ami.aws_linux.id}"

  instance_type = "t2.micro"

  security_groups = ["${aws_security_group.bastion.id}"]

  key_name = "${var.key-name}"

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_autoscaling_group" "bastion-a" {
  name                 = "bastion-a"
  launch_configuration = "${aws_launch_configuration.bastion.name}"
  min_size             = 1
  max_size             = 2

  vpc_zone_identifier = ["${aws_subnet.bastion-a.id}"]

  load_balancers = ["${aws_elb.bastion-elb.id}"]

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_autoscaling_group" "bastion-b" {
  name                 = "bastion-b"
  launch_configuration = "${aws_launch_configuration.bastion.name}"
  min_size             = 1
  max_size             = 2

  load_balancers = ["${aws_elb.bastion-elb.id}"]

  vpc_zone_identifier = ["${aws_subnet.bastion-b.id}"]

  lifecycle {
    create_before_destroy = true
  }

  tag {
    key                 = "type"
    value               = "bastion"
    propagate_at_launch = true
  }
}
