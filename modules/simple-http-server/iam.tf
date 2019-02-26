resource "aws_iam_instance_profile" "simple-http-server" {
  name = "${var.app-name}-simple-http-server"
  role = "${aws_iam_role.simple-http-server.name}"
}

resource "aws_iam_role" "simple-http-server" {
  name = "${var.app-name}-simple-http-server"
  path = "/"

  tags = "${map("Name", "${var.app-name}-simple-http-server", "version", var.version, var.app-name, true)}"

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
