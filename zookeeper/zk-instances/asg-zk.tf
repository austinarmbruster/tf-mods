resource "aws_launch_configuration" "zookeeper" {
  name_prefix = "zookeeper-"

  image_id = "${data.aws_ami.centos7.id}"

  #user_data = "${file("zookeeper-setup.yaml")}"
  user_data = "${data.template_file.zookeeper-setup.rendered}"

  instance_type = "t2.micro"

  security_groups = ["${aws_security_group.zookeeper.id}"]

  key_name = "${var.key-name}"

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_autoscaling_group" "zookeeper" {
  count = "${var.zookeeper-instance-count}"

  name                 = "zookeeper-${count.index}"
  launch_configuration = "${aws_launch_configuration.zookeeper.name}"
  min_size             = 1
  max_size             = 2

  vpc_zone_identifier = ["${element(aws_subnet.zookeeper.*.id, count.index)}"]

  load_balancers = ["${element(aws_elb.zookeeper-elb.*.id, count.index)}"]

  lifecycle {
    create_before_destroy = true
  }
}
