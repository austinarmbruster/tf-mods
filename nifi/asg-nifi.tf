resource "aws_launch_configuration" "nifi" {
  name_prefix = "nifi-"

  image_id = "${data.aws_ami.centos7.id}"

  #user_data = "${file("nifi-setup.yaml")}"
  user_data = "${data.template_file.nifi-setup.rendered}"

  instance_type = "t2.micro"

  security_groups = ["${aws_security_group.nifi.id}"]

  key_name = "${var.key-name}"

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_autoscaling_group" "nifi" {
  count = "${length(var.azs)}"

  name                 = "nifi-${count.index}"
  launch_configuration = "${aws_launch_configuration.nifi.name}"
  min_size             = 1
  max_size             = 2

  vpc_zone_identifier = ["${element(aws_subnet.nifi.*.id, count.index)}"]

  load_balancers = ["${aws_elb.nifi-elb.id}"]

  lifecycle {
    create_before_destroy = true
  }
}
