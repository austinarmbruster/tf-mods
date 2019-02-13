resource "aws_launch_configuration" "reverse-proxy" {
  name_prefix = "${var.app-name}-reverse-proxy-"

  instance_type = "t2.micro"

  image_id = "${data.aws_ami.aws-linux.id}"

  iam_instance_profile = "${aws_iam_instance_profile.reverse-proxy.name}"
  security_groups      = ["${aws_security_group.reverse-proxy.id}"]

  user_data = "${file("${path.module}/reverse-proxy.yaml")}"

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_autoscaling_group" "reverse-proxy" {
  name                      = "${var.app-name}-reverse-proxy"
  max_size                  = 5
  min_size                  = 1
  health_check_grace_period = 360
  health_check_type         = "ELB"
  desired_capacity          = 1
  force_delete              = true
  launch_configuration      = "${aws_launch_configuration.reverse-proxy.name}"
  vpc_zone_identifier       = ["${data.aws_subnet.reverse-proxy.*.id}"]

  target_group_arns = ["${aws_lb_target_group.reverse-proxy.arn}"]

  tag {
    key                 = "version"
    value               = "${var.version}"
    propagate_at_launch = true
  }

  tag {
    key                 = "purpose"
    value               = "${var.app-name}-reverse-proxy"
    propagate_at_launch = true
  }
}
