resource "digitalocean_firewall" "swarm" {
  name = "swarm"

  tags = [
    "${digitalocean_tag.docker_swarm_public.id}",
    "${digitalocean_tag.docker_swarm.id}"
  ]

  inbound_rule = [
    { // ssh
      protocol           = "tcp"
      port_range         = "22"
      source_addresses   = ["0.0.0.0/0", "::/0"]
      source_tags = [
        "${digitalocean_tag.docker_swarm_public.id}",
      ]
    },
    { // http
      protocol           = "tcp"
      port_range         = "80"
      source_addresses   = ["0.0.0.0/0", "::/0"]
      source_tags = [
        "${digitalocean_tag.docker_swarm_public.id}",
      ]
    },
    { // ssl
      protocol           = "tcp"
      port_range         = "443"
      source_addresses   = ["0.0.0.0/0", "::/0"]
      source_tags = [
        "${digitalocean_tag.docker_swarm_public.id}",
      ]
    },
    { // nfs
      protocol           = "tcp"
      port_range         = "2049"
      source_tags = [
        "${digitalocean_tag.docker_swarm_public.id}",
        "${digitalocean_tag.docker_swarm.id}",
      ]
    },
    { // docker swarm
      protocol           = "tcp"
      port_range         = "2375"
      source_tags = [
        "${digitalocean_tag.docker_swarm_public.id}",
        "${digitalocean_tag.docker_swarm.id}",
      ]
    },
    { // docker swarm
      protocol           = "tcp"
      port_range         = "2376"
      source_tags = [
        "${digitalocean_tag.docker_swarm_public.id}",
        "${digitalocean_tag.docker_swarm.id}",
      ]
    },
    { // docker swarm
      protocol           = "tcp"
      port_range         = "2377"
      source_tags = [
        "${digitalocean_tag.docker_swarm_public.id}",
        "${digitalocean_tag.docker_swarm.id}",
      ]
    },
    { // docker swarm
      protocol           = "tcp"
      port_range         = "4789"
      source_tags = [
        "${digitalocean_tag.docker_swarm_public.id}",
        "${digitalocean_tag.docker_swarm.id}",
      ]
    },
    { // docker swarm
      protocol           = "udp"
      port_range         = "4789"
      source_tags = [
        "${digitalocean_tag.docker_swarm_public.id}",
        "${digitalocean_tag.docker_swarm.id}",
      ]
    },
    { // docker swarm
      protocol           = "tcp"
      port_range         = "7946"
      source_tags = [
        "${digitalocean_tag.docker_swarm_public.id}",
        "${digitalocean_tag.docker_swarm.id}",
      ]
    },
    { // docker swarm
      protocol           = "udp"
      port_range         = "7946"
      source_tags = [
        "${digitalocean_tag.docker_swarm_public.id}",
        "${digitalocean_tag.docker_swarm.id}",
      ]
    },
    { // prometheus
      protocol           = "tcp"
      port_range         = "8080"
      source_tags = [
        "${digitalocean_tag.docker_swarm_public.id}",
        "${digitalocean_tag.docker_swarm.id}",
      ]
    },
    { // prometheus
      protocol           = "tcp"
      port_range         = "9091"
      source_tags = [
        "${digitalocean_tag.docker_swarm_public.id}",
        "${digitalocean_tag.docker_swarm.id}",
      ]
    },
    { // prometheus
      protocol           = "tcp"
      port_range         = "9100"
      source_tags = [
        "${digitalocean_tag.docker_swarm_public.id}",
        "${digitalocean_tag.docker_swarm.id}",
      ]
    },
    { // prometheus
      protocol           = "tcp"
      port_range         = "9101"
      source_tags = [
        "${digitalocean_tag.docker_swarm_public.id}",
        "${digitalocean_tag.docker_swarm.id}",
      ]
    },
    { // jenkins
      protocol           = "tcp"
      port_range         = "50000"
      source_tags = [
        "${digitalocean_tag.docker_swarm_public.id}",
        "${digitalocean_tag.docker_swarm.id}",
      ]
    }
  ]

  outbound_rule = [
    {
      protocol                = "tcp"
      port_range              = "all"
      destination_addresses   = ["0.0.0.0/0", "::/0"]
    },
    {
      protocol                = "udp"
      port_range              = "all"
      destination_addresses   = ["0.0.0.0/0", "::/0"]
    }
  ]
}