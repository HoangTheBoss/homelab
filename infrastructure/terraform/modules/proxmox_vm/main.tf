resource "proxmox_virtual_environment_vm" "this" {
  name        = var.name
  description = var.description
  node_name   = var.node_name
  vm_id       = var.vm_id
  tags            = var.tags
  on_boot         = var.on_boot
  machine         = var.machine
  keyboard_layout = var.keyboard_layout


  scsi_hardware = var.scsi_hardware

  dynamic "agent" {
    for_each = var.agent != null ? [var.agent] : []
    content {
      enabled = agent.value.enabled
      type    = agent.value.type
    }
  }

  cpu {
    cores = var.cpu_cores
    type  = var.cpu_type
  }

  memory {
    dedicated = var.memory_dedicated
  }

  dynamic "network_device" {
    for_each = var.network_devices
    content {
      bridge      = network_device.value.bridge
      mac_address = network_device.value.mac_address
      firewall    = network_device.value.firewall
    }
  }

  dynamic "disk" {
    for_each = var.disks
    content {
      datastore_id = disk.value.datastore_id
      interface    = disk.value.interface
      size         = disk.value.size
      iothread     = disk.value.iothread
    }
  }

  dynamic "efi_disk" {
    for_each = var.efi_disk != null ? [var.efi_disk] : []
    content {
      datastore_id      = efi_disk.value.datastore_id
      file_format       = lookup(efi_disk.value, "file_format", "raw")
      pre_enrolled_keys = lookup(efi_disk.value, "pre_enrolled_keys", true)
      type              = lookup(efi_disk.value, "type", "4m")
    }
  }

  dynamic "hostpci" {
    for_each = var.hostpcis
    content {
      device = hostpci.value.device
      id     = hostpci.value.id
      pcie   = lookup(hostpci.value, "pcie", true)
      rombar = lookup(hostpci.value, "rombar", true)
    }
  }

  operating_system {
    type = var.os_type
  }

  dynamic "startup" {
    for_each = var.startup != null ? [var.startup] : []
    content {
      order      = lookup(startup.value, "order", null)
      up_delay   = lookup(startup.value, "up_delay", null)
      down_delay = lookup(startup.value, "down_delay", null)
    }
  }
}
