Usage:

```
module "docker_swarm" {
  source = "../modules/docker-swarm"

  key_name   = "do-swarm"
  key_path   = "../secrets/production-swarm/do-swarm.pub"

  swarm_region = "nyc1"

  # Swarm managerse should strictly be used for orchestration and don't need to be very powerful. We
  # will have 4-5 of these active
  swarm_manager_size = "1gb"
  swarm_managers = 0

  swarm_worker_size = "4gb"
  swarm_workers = 0

  # If you change this - make sure you know what you are doing! This will most likely spawn an entirely
  # new manager cluster and you will lose control of your old one.
  primary_manager_snapshot_id = "26811737"

  swarm_snapshot_id = "26811737"
}
```