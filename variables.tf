variable "token" {
  description = "Linode token for Terraform use"
}

variable "region" {
  description = "Server location"
  default     = "eu-central"
}

variable "root_pass" {
  description = "Root password"
}

variable "type" {
  description = "Tier of the instance"
  default     = "g6-nanode-1"
}

variable "environments" {
  description = "Environment types"
}

variable "image" {
  description = "OS image to load on the instance"
  default     = "linode/ubuntu20.44"
}

variable "authorized_keys" {
  description = "Public ssh key"
  sensitive   = true
}

variable "keys_file" {
  description = "File path to public ssh key if no authorized keys (local use)"
}

variable "label" {
  description = "Instance identifier"
}

variable "group" {
  description = "Group name (domain) of the instance"
}
