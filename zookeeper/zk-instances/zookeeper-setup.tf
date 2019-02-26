data "template_file" "zookeeper-setup" {
  template = "${file("${path.module}/zookeeper-setup.yaml")}"

  vars {
    zookeeper_url     = "${var.zookeeper-url}"
    zookeeper_version = "${var.zookeeper-version}"
  }
}
