variable "dobs_token" {
  default = ""
}

variable "swarm_manager_token" {
  default = ""
}

variable "swarm_worker_token" {
  default = ""
}

variable "primary_manager_snapshot_id" {
  default = "26811737"
}

variable "swarm_snapshot_id" {
  default = "26811737"
}

variable "swarm_manager_ip" {
  default = ""
}

variable "swarm_managers" {
  default = 0
}

variable "swarm_workers" {
  default = 0
}

variable "swarm_region" {
  default = "sfo2"
}

variable "swarm_manager_size" {
  default = "1gb"
}

variable "swarm_worker_size" {
  default = "4gb"
}

variable "key_name" {
  default = ""
}

variable "key_path" {
  default = ""
}

variable "private_key_path" {
  default = ""
}

variable "primary_manager_private_ip" {
  default = "0.0.0.0"
}

variable "jenkins_master_size" {
  default = "4gb"
}

variable "jenkins_agent_size" {
  default = "512mb"
}

variable "jenkins_masters" {
  default = 0
}

variable "jenkins_agents" {
  default = 0
}