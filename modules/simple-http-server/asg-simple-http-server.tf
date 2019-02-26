resource "aws_launch_configuration" "simple-http-server" {
  name_prefix = "${var.app-name}-simple-http-server-"

  instance_type = "t2.micro"

  image_id = "${data.aws_ami.aws-linux.id}"

  iam_instance_profile = "${aws_iam_instance_profile.simple-http-server.name}"
  security_groups      = ["${aws_security_group.simple-http-server.id}"]

  user_data = "${file("${path.module}/simple-http-server.yaml")}"

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_autoscaling_group" "simple-http-server" {
  name                      = "${var.app-name}-simple-http-server"
  max_size                  = 5
  min_size                  = 1
  health_check_grace_period = 360
  health_check_type         = "ELB"
  desired_capacity          = 1
  force_delete              = true
  launch_configuration      = "${aws_launch_configuration.simple-http-server.name}"
  vpc_zone_identifier       = ["${data.aws_subnet.simple-http-server.*.id}"]

  target_group_arns = ["${aws_lb_target_group.simple-http-server.arn}"]

  tag {
    key                 = "version"
    value               = "${var.version}"
    propagate_at_launch = true
  }

  tag {
    key                 = "purpose"
    value               = "${var.app-name}-simple-http-server"
    propagate_at_launch = true
  }

  tag {
    key                 = "${var.app-name}"
    value               = true
    propagate_at_launch = true
  }
}
