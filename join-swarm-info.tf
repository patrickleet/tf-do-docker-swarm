data "external" "join_swarm_info" {
  program = ["${path.module}/join-swarm-info.sh"]
  
  query = {
    host = "${digitalocean_droplet.primary-swarm-manager.ipv4_address}"
  }
}