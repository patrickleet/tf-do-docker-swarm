resource "digitalocean_firewall" "swarm" {
  name = "swarm"

  tags = [
    "${digitalocean_tag.docker_swarm_public.id}",
    "${digitalocean_tag.docker_swarm.id}"
  ]

  inbound_rule = [
    {
      protocol           = "tcp"
      port_range         = "22"
      source_addresses   = ["0.0.0.0/0"]
      source_tags = [
        "${digitalocean_tag.docker_swarm_public.id}",
      ]
    },
    {
      protocol           = "tcp"
      port_range         = "80"
      source_addresses   = ["0.0.0.0/0", "::/0"]
      source_tags = [
        "${digitalocean_tag.docker_swarm_public.id}",
      ]
    },
    {
      protocol           = "tcp"
      port_range         = "2049"
      source_tags = [
        "${digitalocean_tag.docker_swarm_public.id}",
        "${digitalocean_tag.docker_swarm.id}",
      ]
    },
    {
      protocol           = "tcp"
      port_range         = "2375"
      source_tags = [
        "${digitalocean_tag.docker_swarm_public.id}",
        "${digitalocean_tag.docker_swarm.id}",
      ]
    },
    {
      protocol           = "tcp"
      port_range         = "2376"
      source_tags = [
        "${digitalocean_tag.docker_swarm_public.id}",
        "${digitalocean_tag.docker_swarm.id}",
      ]
    },
    {
      protocol           = "tcp"
      port_range         = "2377"
      source_tags = [
        "${digitalocean_tag.docker_swarm_public.id}",
        "${digitalocean_tag.docker_swarm.id}",
      ]
    },
    {
      protocol           = "tcp"
      port_range         = "4789"
      source_tags = [
        "${digitalocean_tag.docker_swarm_public.id}",
        "${digitalocean_tag.docker_swarm.id}",
      ]
    },
    {
      protocol           = "udp"
      port_range         = "4789"
      source_tags = [
        "${digitalocean_tag.docker_swarm_public.id}",
        "${digitalocean_tag.docker_swarm.id}",
      ]
    },
    {
      protocol           = "tcp"
      port_range         = "7946"
      source_tags = [
        "${digitalocean_tag.docker_swarm_public.id}",
        "${digitalocean_tag.docker_swarm.id}",
      ]
    },
    {
      protocol           = "udp"
      port_range         = "7946"
      source_tags = [
        "${digitalocean_tag.docker_swarm_public.id}",
        "${digitalocean_tag.docker_swarm.id}",
      ]
    },
    {
      protocol           = "tcp"
      port_range         = "50000"
      source_tags = [
        "${digitalocean_tag.docker_swarm_public.id}",
        "${digitalocean_tag.docker_swarm.id}",
      ]
    },
    {
      protocol           = "tcp"
      port_range         = "443"
      source_addresses   = ["0.0.0.0/0", "::/0"]
      source_tags = [
        "${digitalocean_tag.docker_swarm_public.id}",
      ]
    },
  ]

  outbound_rule {
    port_range              = "0"
    destination_addresses   = ["0.0.0.0/0", "::/0"]
    destination_tags = [
      "${digitalocean_tag.docker_swarm_public.id}",
      "${digitalocean_tag.docker_swarm.id}",
    ]
  }
}