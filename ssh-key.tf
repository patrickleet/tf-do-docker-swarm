resource "digitalocean_ssh_key" "docker" {
  name = "${var.key_name}"
  public_key = "${file("${var.key_path}")}"
}