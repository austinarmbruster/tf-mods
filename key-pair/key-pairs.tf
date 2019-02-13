resource "aws_key_pair" "deployer" {
  key_name   = "${var.key-name}"
  public_key = "${file(var.public-key-file)}"
}
