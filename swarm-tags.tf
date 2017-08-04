resource "digitalocean_tag" "docker_swarm_public" {
  name = "docker-swarm-public"
}

resource "digitalocean_tag" "docker_swarm" {
  name = "docker-swarm"
}