resource "digitalocean_tag" "docker_swarm_public" {
  name = "docker-swarm-public"
}

resource "digitalocean_tag" "docker_swarm" {
  name = "docker-swarm"
}

resource "digitalocean_tag" "jenkins" {
  name = "jenkins"
}

resource "digitalocean_tag" "jenkins_master" {
  name = "jenkins-master"
}

resource "digitalocean_tag" "jenkins_agent" {
  name = "jenkins-agent"
}