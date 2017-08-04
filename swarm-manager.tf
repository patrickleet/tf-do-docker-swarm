resource "digitalocean_droplet" "swarm-manager" { 
  image = "${var.swarm_snapshot_id}"
  size = "${var.swarm_manager_size}"
  count = "${var.swarm_managers}"
  name = "${format("swarm-manager-%02d", (count.index + 1))}" 
  region = "${var.swarm_region}"
  private_networking = true
  ssh_keys = [ "${digitalocean_ssh_key.docker.id}" ]

  connection {
    user = "root"
    private_key = "${file("../../secrets/prod-swarm-key/do")}" 
    agent = false
  }

  provisioner "remote-exec" {
    inline = [
      "docker swarm join --token ${var.swarm_manager_token} --advertise-addr ${self.ipv4_address_private} ${var.swarm_manager_ip}:2377;"
    ] 
  }
}

resource "digitalocean_floating_ip" "swarm_manager_1" {
  droplet_id = "${digitalocean_droplet.swarm-manager.0.id}"
  region = "${var.swarm_region}"
}

resource "digitalocean_floating_ip" "swarm_manager_2" {
  droplet_id = "${digitalocean_droplet.swarm-manager.1.id}"
  region = "${var.swarm_region}"
}

output "swarm_manager_1_public_ip" {
  value = "${digitalocean_droplet.swarm-manager.0.ipv4_address}"
}

output "swarm_manager_1_private_ip" {
  value = "${digitalocean_droplet.swarm-manager.0.ipv4_address_private}"
}

output "swarm_manager_2_public_ip" {
  value = "${digitalocean_droplet.swarm-manager.1.ipv4_address}"
}

output "swarm_manager_2_private_ip" {
  value = "${digitalocean_droplet.swarm-manager.1.ipv4_address_private}"
}