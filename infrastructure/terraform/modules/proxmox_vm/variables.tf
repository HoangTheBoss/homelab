variable "node_name" {
  description = "The name of the Proxmox node."
  type        = string
}

variable "vm_id" {
  description = "The ID of the VM."
  type        = number
}

variable "name" {
  description = "The name of the VM."
  type        = string
}

variable "description" {
  description = "The description of the VM."
  type        = string
  default     = null
}

variable "cpu_cores" {
  description = "The number of CPU cores."
  type        = number
  default     = 1
}

variable "cpu_type" {
  description = "The CPU type."
  type        = string
  default     = "host"
}

variable "memory_dedicated" {
  description = "The amount of memory in MB."
  type        = number
  default     = 1024
}

variable "scsi_hardware" {
  description = "The SCSI hardware controller."
  type        = string
  default     = "virtio-scsi-single"
}

variable "machine" {
  description = "The machine type."
  type        = string
  default     = "q35"
}

variable "tags" {
  description = "Tags for the VM."
  type        = list(string)
  default     = []
}

variable "agent" {
  description = "QEMU agent configuration."
  type = object({
    enabled = optional(bool, false)
    type    = optional(string, "virtio")
  })
  default = null
}

variable "on_boot" {
  description = "Whether to start the VM on boot."
  type        = bool
  default     = true
}

variable "keyboard_layout" {
  description = "Keyboard layout."
  type        = string
  default     = null
}

variable "network_devices" {
  description = "Network devices configuration."
  type = list(object({
    bridge      = string
    mac_address = optional(string)
    firewall    = optional(bool, false)
  }))
  default = []
}

variable "disks" {
  description = "Disks configuration."
  type = list(object({
    datastore_id = string
    interface    = string
    size         = number
    iothread     = optional(bool, false)
  }))
  default = []
}

variable "efi_disk" {
  description = "EFI disk configuration."
  type = object({
    datastore_id      = string
    file_format       = optional(string, "raw")
    pre_enrolled_keys = optional(bool, true)
    type              = optional(string, "4m")
  })
  default = null
}

variable "hostpcis" {
  description = "Host PCI passthrough configuration."
  type = list(object({
    device = string
    id     = string
    pcie   = optional(bool, true)
    rombar = optional(bool, true)
  }))
  default = []
}

variable "os_type" {
  description = "The OS type."
  type        = string
  default     = "l26"
}

variable "startup" {
  description = "Startup and shutdown behavior."
  type = any
  default = null
}
