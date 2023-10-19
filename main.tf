provider "linode" {
  token = var.token
}

resource "linode_instance" "autoshop_fleet" {
  for_each = var.environments

  image            = each.value.image
  label            = each.value.label
  group            = var.group
  region           = var.region
  type             = each.value.type
  authorized_keys  = [var.authorized_keys]
  root_pass        = var.root_pass
  private_ip       = true
  watchdog_enabled = true

  tags = [var.label, var.group, each.value.type, "database"]
}

locals {
  instances = values(linode_instance.autoshop_fleet)
}

resource "linode_volume" "autoshop_fleet_volumes" {
  count     = length(local.instances)
  label     = "${local.instances[count.index].label}-${local.instances[count.index].group}-volume"
  region    = local.instances[count.index].region
  linode_id = local.instances[count.index].id

  # in GB
  size = 10
  tags = [var.group, var.label, "volume"]
}
