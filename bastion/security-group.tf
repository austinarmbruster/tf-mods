resource "aws_security_group" "bastion" {
  name        = "bastion-group"
  description = "Bastion: SSH"

  vpc_id = "${var.vpc-id}"

  ingress {
    from_port   = "22"
    to_port     = "22"
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
    Name = "bastion"
  }
}
