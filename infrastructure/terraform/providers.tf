terraform {
  required_providers {
    proxmox = {
      source = "bpg/proxmox"
      version = "0.106.0"
    }
  }
}

provider "proxmox" {
  # endpoint = ""
  # use PROXMOX_VE_ENDPOINT

  # use either PROXMOX_VE_API_TOKEN, or
  # PROXMOX_VE_USERNAME and PROXMOX_VE_PASSWORD

  # because self-signed TLS certificate is in use
  insecure = true
}