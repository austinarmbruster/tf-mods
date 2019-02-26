resource "aws_security_group" "zookeeper-elb" {
  name        = "zookeeper-group"
  description = "zookeeper: 2121, 2888, & 3888"

  vpc_id = "${data.aws_vpc.zookeeper.id}"

  ingress {
    from_port   = "2121"
    to_port     = "2121"
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    self        = true
  }

  ingress {
    from_port   = "2888"
    to_port     = "2888"
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    self        = true
  }

  ingress {
    from_port   = "3888"
    to_port     = "3888"
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    self        = true
  }

  egress {
    from_port   = "0"
    to_port     = "0"
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags {
    Name = "zookeeper-elb"
  }
}
