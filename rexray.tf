data "template_file" "rexray" {
  template = "${file("${path.module}/rexray.tpl")}"

  vars {
    dobs_token = "${var.dobs_token}"
    swarm_region = "${var.swarm_region}"
  }
}