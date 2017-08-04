resource "digitalocean_droplet" "primary-swarm-manager" { 
  image = "${var.primary_manager_snapshot_id}"
  size = "${var.swarm_manager_size}"
  count = 1
  name = "primary-swarm-manager" 
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
      "docker swarm init --advertise-addr ${self.ipv4_address_private};",
    ] 
  }
}

resource "digitalocean_floating_ip" "primary-swarm-manager" {
  droplet_id = "${digitalocean_droplet.primary-swarm-manager.0.id}"
  region = "${var.swarm_region}"
}

output "primary_manager_ip" {
  value = "${digitalocean_floating_ip.primary-swarm-manager.ip_address}"
}

output "primary_swarm_manager_public_ip" {
  value = "${digitalocean_droplet.primary-swarm-manager.0.ipv4_address}"
}

output "primary_swarm_manager_private_ip" {
  value = "${digitalocean_droplet.primary-swarm-manager.0.ipv4_address_private}"
}
