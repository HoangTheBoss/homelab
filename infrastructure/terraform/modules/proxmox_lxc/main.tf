resource "proxmox_virtual_environment_container" "this" {
  node_name     = var.node_name
  vm_id         = var.vm_id
  tags          = var.tags
  unprivileged  = var.unprivileged
  start_on_boot = var.start_on_boot
  started       = var.started
  description   = var.description
  protection    = var.protection

  initialization {
    hostname = var.name

    dynamic "ip_config" {
      for_each = var.network_interfaces
      content {
        ipv4 {
          address = ip_config.value.ipv4_address
          gateway = ip_config.value.ipv4_gateway
        }
      }
    }
  }

  cpu {
    cores = var.cpu_cores
  }

  memory {
    dedicated = var.memory_dedicated
    swap      = var.memory_swap
  }

  operating_system {
    type             = var.os_type
    template_file_id = var.template_file_id
  }

  lifecycle {
    ignore_changes = [
      operating_system[0].template_file_id,
      disk,
      mount_point
    ]
  }

  dynamic "network_interface" {
    for_each = var.network_interfaces
    content {
      name    = network_interface.value.name
      bridge  = network_interface.value.bridge
      enabled = network_interface.value.enabled
      mtu     = network_interface.value.mtu
    }
  }

  dynamic "disk" {
    for_each = var.disks
    content {
      datastore_id = disk.value.datastore_id
      size         = disk.value.size
    }
  }

  dynamic "mount_point" {
    for_each = var.mount_points
    content {
      volume = mount_point.value.volume
      path   = mount_point.value.path
      size   = mount_point.value.size
      backup = mount_point.value.backup
    }
  }

  dynamic "console" {
    for_each = var.console != null ? [var.console] : []
    content {
      enabled   = console.value.enabled
      tty_count = console.value.tty_count
      type      = console.value.type
    }
  }

  dynamic "features" {
    for_each = var.features != null ? [var.features] : []
    content {
      fuse    = features.value.fuse
      keyctl  = features.value.keyctl
      mknod   = features.value.mknod
      nesting = features.value.nesting
      mount   = features.value.mount
    }
  }
}
