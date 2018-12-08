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

resource "aws_autoscaling_group" "bastion" {
  count = "${length(var.azs)}"

  name                 = "bastion-${count.index}"
  launch_configuration = "${aws_launch_configuration.bastion.name}"
  min_size             = 1
  max_size             = 2

  vpc_zone_identifier = ["${element(aws_subnet.bastion.*.id, count.index)}"]

  load_balancers = ["${aws_elb.bastion-elb.id}"]

  lifecycle {
    create_before_destroy = true
  }
}
