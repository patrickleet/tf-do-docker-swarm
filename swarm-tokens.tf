data "external" "swarm_join_token" {
  program = ["./get-join-tokens.sh"]
  query = {
    host = "${digitalocean_droplet.primary-swarm-manager.ipv4_address}"
  }
}