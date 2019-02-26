resource "aws_iam_instance_profile" "reverse-proxy" {
  name = "${var.app-name}-reverse-proxy"
  role = "${aws_iam_role.reverse-proxy.name}"
}

resource "aws_iam_role" "reverse-proxy" {
  name = "${var.app-name}-reverse-proxy"
  path = "/"

  tags {
    Name    = "${var.app-name}-reverse-proxy"
    version = "${var.version}"
  }

  assume_role_policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Action": "sts:AssumeRole",
            "Principal": {
               "Service": "ec2.amazonaws.com"
            },
            "Effect": "Allow",
            "Sid": ""
        }
    ]
}
EOF
}
