resource "digitalocean_droplet" "swarm-worker" { 
  image = "${var.swarm_snapshot_id}"
  size = "${var.swarm_worker_size}"
  count = "${var.swarm_workers}"
  name = "${format("swarm-worker-%02d", (count.index + 1))}" 
  region = "${var.swarm_region}"
  private_networking = true
  ssh_keys = [ "${digitalocean_ssh_key.docker.id}" ]

  connection {
    user = "root"
    private_key = "${file("${var.private_key}")}" 
    agent = false
  }

  provisioner "remote-exec" {
    inline = [
      "docker swarm join --token ${var.swarm_worker_token} --advertise-addr ${self.ipv4_address_private} ${var.swarm_manager_ip}:2377",
      "echo \"${data.template_file.rexray.rendered}\" | sudo tee /etc/rexray/config.yml",
      "sudo rexray service start >/dev/null 2>/dev/null",
    ]
  } 
}