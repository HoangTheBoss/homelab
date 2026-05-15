variable "node_name" {
  description = "The name of the Proxmox node."
  type        = string
}

variable "vm_id" {
  description = "The ID of the container."
  type        = number
}

variable "name" {
  description = "The name of the container."
  type        = string
}

variable "description" {
  description = "The description of the container."
  type        = string
  default     = null
}

variable "cpu_cores" {
  description = "The number of CPU cores."
  type        = number
  default     = 1
}

variable "memory_dedicated" {
  description = "The amount of memory in MB."
  type        = number
  default     = 512
}

variable "memory_swap" {
  description = "The amount of swap in MB."
  type        = number
  default     = 512
}

variable "tags" {
  description = "Tags for the container."
  type        = list(string)
  default     = []
}

variable "unprivileged" {
  description = "Whether the container is unprivileged."
  type        = bool
  default     = true
}

variable "start_on_boot" {
  description = "Whether to start the container on boot."
  type        = bool
  default     = true
}

variable "started" {
  description = "Whether the container is started."
  type        = bool
  default     = true
}

variable "protection" {
  description = "Whether the container is protected."
  type        = bool
  default     = false
}

variable "os_type" {
  description = "The OS type."
  type        = string
  default     = "debian"
}

variable "template_file_id" {
  description = "The identifier for the OS template file."
  type        = string
  default     = ""
}

variable "network_interfaces" {
  description = "Network interfaces configuration."
  type = list(object({
    name    = string
    bridge  = string
    enabled = optional(bool, true)
    ipv4_address = optional(string)
    ipv4_gateway = optional(string)
    mtu          = optional(number)
  }))
  default = []
}

variable "disks" {
  description = "Disks configuration."
  type = list(object({
    datastore_id = string
    size         = number
  }))
  default = []
}

variable "mount_points" {
  description = "Mount points configuration."
  type = list(object({
    volume = string
    path   = string
    size   = string
    backup = optional(bool, true)
  }))
  default = []
}

variable "console" {
  description = "Console configuration."
  type = object({
    enabled   = optional(bool, true)
    tty_count = optional(number, 2)
    type      = optional(string, "tty")
  })
  default = {
    enabled   = true
    tty_count = 2
    type      = "tty"
  }
}

variable "features" {
  description = "LXC features."
  type = object({
    fuse    = optional(bool, false)
    keyctl  = optional(bool, false)
    mknod   = optional(bool, false)
    nesting = optional(bool, false)
    mount   = optional(list(string), [])
  })
  default = null
}
