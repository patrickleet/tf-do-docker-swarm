resource "digitalocean_droplet" "swarm-worker-monitor" { 
  image = "${var.swarm_snapshot_id}"
  size = "${var.monitor_worker_size}"
  count = "${var.monitor_workers}"
  name = "${format("monitor-%02d", (count.index + 1))}" 
  region = "${var.swarm_region}"
  private_networking = true
  ssh_keys = [ "${digitalocean_ssh_key.docker.id}" ]
  tags = [
    "${digitalocean_tag.docker_swarm.id}",
    "${digitalocean_tag.monitor.id}",
  ]

  connection {
    user = "root"
    private_key = "${file("${var.private_key_path}")}"
    agent = false
  }

  provisioner "remote-exec" {
    inline = [
      "docker swarm join --token ${data.external.join_swarm_info.result.worker} --advertise-addr ${self.ipv4_address_private} ${var.primary_manager_private_ip}:2377",
      "docker -H ${var.primary_manager_private_ip} node update --label-add reserved=true --label-add for=monitor ${self.name}",
      "echo \"${data.template_file.rexray.rendered}\" | sudo tee /etc/rexray/config.yml",
      "sudo rexray service start >/dev/null 2>/dev/null"
    ]
  } 
}
