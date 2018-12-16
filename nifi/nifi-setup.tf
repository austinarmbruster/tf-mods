data "template_file" "nifi-setup" {
  template = "${file("${path.module}/nifi-setup.yaml")}"

  vars {
    nifi_url = "${var.nifi-url}"
  }
}
