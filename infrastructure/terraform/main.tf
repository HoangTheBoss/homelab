module "proxmox_vm" {
  source   = "./modules/proxmox_vm"
  for_each = local.vms

  vm_id            = tonumber(each.key)
  name             = each.value.name
  description      = lookup(each.value, "description", null)
  node_name        = each.value.node_name
  cpu_cores        = each.value.cpu_cores
  cpu_type         = lookup(each.value, "cpu_type", "host")
  memory_dedicated = each.value.memory_dedicated
  scsi_hardware    = lookup(each.value, "scsi_hardware", "virtio-scsi-single")
  machine          = lookup(each.value, "machine", "q35")
  agent            = lookup(each.value, "agent", null)
  on_boot          = lookup(each.value, "on_boot", true)
  keyboard_layout  = lookup(each.value, "keyboard_layout", null)
  tags             = each.value.tags

  network_devices = lookup(each.value, "network_devices", [
    {
      bridge   = "vmbr1"
      firewall = true
    }
  ])

  disks    = lookup(each.value, "disks", [])
  efi_disk = lookup(each.value, "efi_disk", null)
  hostpcis = lookup(each.value, "hostpcis", [])
  os_type  = lookup(each.value, "os_type", "l26")
  startup  = lookup(each.value, "startup", null)
}

module "proxmox_lxc" {
  source   = "./modules/proxmox_lxc"
  for_each = local.lxcs

  vm_id            = tonumber(each.key)
  name             = each.value.name
  description      = lookup(each.value, "description", null)
  node_name        = each.value.node_name
  cpu_cores        = each.value.cpu_cores
  memory_dedicated = each.value.memory_dedicated
  memory_swap      = lookup(each.value, "memory_swap", 512)
  tags             = each.value.tags
  unprivileged     = lookup(each.value, "unprivileged", true)
  start_on_boot    = lookup(each.value, "start_on_boot", true)
  started          = lookup(each.value, "started", true)
  protection       = lookup(each.value, "protection", false)
  os_type          = lookup(each.value, "os_type", "debian")
  template_file_id = lookup(each.value, "template_file_id", "local:vztmpl/debian-12-standard_12.2-1_amd64.tar.zst")

  network_interfaces = lookup(each.value, "network_interfaces", [
    {
      name   = "eth0"
      bridge = "vmbr1"
    }
  ])

  disks        = lookup(each.value, "disks", [])
  mount_points = lookup(each.value, "mount_points", [])
  
  # Use module defaults if not in locals
  console      = contains(keys(each.value), "console") ? each.value.console : {
    enabled   = true
    tty_count = 2
    type      = "tty"
  }
  
  features     = lookup(each.value, "features", null)
}
