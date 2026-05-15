locals {
  vms = {
    "100" = {
      name             = "xpenology-nas"
      node_name        = "proxmox"
      cpu_cores        = 8
      memory_dedicated = 8192
      tags             = []
      on_boot          = true
      cpu_type         = "host"
      scsi_hardware    = "virtio-scsi-single"
      machine          = "q35"
      keyboard_layout  = "en-us"
      os_type          = "l26"
      hostpcis = [
        {
          device = "hostpci0"
          id     = "02:00.0"
          pcie   = true
          rombar = true
        }
      ]
      network_devices = [
        {
          bridge      = "vmbr1"
          mac_address = "BC:24:11:40:4E:6C"
          firewall    = true
        }
      ]
      disks = [
        {
          datastore_id = "local-ssd"
          interface    = "sata0"
          size         = 2
          iothread     = false
        }
      ]
      startup = {
        order = 1
      }
    }
    "202" = {
      name             = "alpine-testing"
      node_name        = "proxmox"
      cpu_cores        = 8
      memory_dedicated = 24576
      tags             = []
      on_boot          = true
      cpu_type         = "host"
      scsi_hardware    = "virtio-scsi-single"
      machine          = "q35"
      keyboard_layout  = "en-us"
      agent            = {
        enabled = true
        type    = "virtio"
      }
      os_type          = "l26"
      network_devices = [
        {
          bridge      = "vmbr1"
          mac_address = "BC:24:11:57:25:C4"
          firewall    = true
        }
      ]
      disks = [
        {
          datastore_id = "local-zfs"
          interface    = "scsi0"
          size         = 64
          iothread     = true
        }
      ]
      efi_disk = {
        datastore_id = "local-zfs"
      }
    }
  }

  lxcs = {
    "101" = {
      name             = "caddy"
      node_name        = "proxmox"
      cpu_cores        = 2
      memory_dedicated = 1024
      tags             = ["community-script", "webserver"]
      description      = "<div align='center'>\n  <a href='https://Helper-Scripts.com' target='_blank' rel='noopener noreferrer'>\n    <img src='https://raw.githubusercontent.com/community-scripts/ProxmoxVE/main/misc/images/logo-81x112.png' alt='Logo' style='width:81px;height:112px;'/>\n  </a>\n\n  <h2 style='font-size: 24px; margin: 20px 0;'>Caddy LXC</h2>\n\n  <p style='margin: 16px 0;'>\n    <a href='https://ko-fi.com/community_scripts' target='_blank' rel='noopener noreferrer'>\n      <img src='https://img.shields.io/badge/&#x2615;-Buy us a coffee-blue' alt='spend Coffee' />\n    </a>\n  </p>\n  \n  <span style='margin: 0 10px;'>\n    <i class=\"fa fa-github fa-fw\" style=\"color: #f5f5f5;\"></i>\n    <a href='https://github.com/community-scripts/ProxmoxVE' target='_blank' rel='noopener noreferrer' style='text-decoration: none; color: #00617f;'>GitHub</a>\n  </span>\n  <span style='margin: 0 10px;'>\n    <i class=\"fa fa-comments fa-fw\" style=\"color: #f5f5f5;\"></i>\n    <a href='https://github.com/community-scripts/ProxmoxVE/discussions' target='_blank' rel='noopener noreferrer' style='text-decoration: none; color: #00617f;'>Discussions</a>\n  </span>\n  <span style='margin: 0 10px;'>\n    <i class=\"fa fa-exclamation-circle fa-fw\" style=\"color: #f5f5f5;\"></i>\n    <a href='https://github.com/community-scripts/ProxmoxVE/issues' target='_blank' rel='noopener noreferrer' style='text-decoration: none; color: #00617f;'>Issues</a>\n  </span>\n</div>\n"
      on_boot          = true
      memory_swap      = 1024
      unprivileged     = true
      protection       = false
      started          = true
      os_type          = "debian"
      network_interfaces = [
        {
          name         = "eth0"
          bridge       = "vmbr1"
          ipv4_address = "10.17.1.121/22"
          ipv4_gateway = "10.17.0.1"
        }
      ]
      disks = [
        {
          datastore_id = "local-zfs"
          size         = 4
        }
      ]
      mount_points = [
        {
          volume = "local-zfs:subvol-101-disk-2"
          path   = "/mnt/linuxmirror"
          size   = "300G"
          backup = true
        }
      ]
      features = {
        keyctl  = true
        nesting = true
      }
    }
    "102" = {
      name             = "syncthing"
      node_name        = "proxmox"
      cpu_cores        = 2
      memory_dedicated = 2048
      tags             = ["community-script", "sync"]
      description      = "<div align='center'>\n  <a href='https://Helper-Scripts.com' target='_blank' rel='noopener noreferrer'>\n    <img src='https://raw.githubusercontent.com/community-scripts/ProxmoxVE/main/misc/images/logo-81x112.png' alt='Logo' style='width:81px;height:112px;'/>\n  </a>\n\n  <h2 style='font-size: 24px; margin: 20px 0;'>Syncthing LXC</h2>\n\n  <p style='margin: 16px 0;'>\n    <a href='https://ko-fi.com/community_scripts' target='_blank' rel='noopener noreferrer'>\n      <img src='https://img.shields.io/badge/&#x2615;-Buy us a coffee-blue' alt='spend Coffee' />\n    </a>\n  </p>\n\n  <span style='margin: 0 10px;'>\n    <i class=\"fa fa-github fa-fw\" style=\"color: #f5f5f5;\"></i>\n    <a href='https://github.com/community-scripts/ProxmoxVE' target='_blank' rel='noopener noreferrer' style='text-decoration: none; color: #00617f;'>GitHub</a>\n  </span>\n  <span style='margin: 0 10px;'>\n    <i class=\"fa fa-comments fa-fw\" style=\"color: #f5f5f5;\"></i>\n    <a href='https://github.com/community-scripts/ProxmoxVE/discussions' target='_blank' rel='noopener noreferrer' style='text-decoration: none; color: #00617f;'>Discussions</a>\n  </span>\n  <span style='margin: 0 10px;'>\n    <i class=\"fa fa-exclamation-circle fa-fw\" style=\"color: #f5f5f5;\"></i>\n    <a href='https://github.com/community-scripts/ProxmoxVE/issues' target='_blank' rel='noopener noreferrer' style='text-decoration: none; color: #00617f;'>Issues</a>\n  </span>\n</div>\n"
      on_boot          = true
      memory_swap      = 512
      unprivileged     = true
      protection       = false
      started          = true
      os_type          = "debian"
      network_interfaces = [
        {
          name         = "eth0"
          bridge       = "vmbr1"
          ipv4_address = "10.17.1.175/22"
          ipv4_gateway = "10.17.0.1"
        }
      ]
      disks = [
        {
          datastore_id = "local-zfs"
          size         = 128
        }
      ]
      features = {
        keyctl  = true
        nesting = true
      }
    }
    "105" = {
      name             = "debian-test"
      node_name        = "proxmox"
      cpu_cores        = 4
      memory_dedicated = 2048
      tags             = ["community-script", "os"]
      description      = "<div align='center'>\n  <a href='https://Helper-Scripts.com' target='_blank' rel='noopener noreferrer'>\n    <img src='https://raw.githubusercontent.com/community-scripts/ProxmoxVE/main/misc/images/logo-81x112.png' alt='Logo' style='width:81px;height:112px;'/>\n  </a>\n\n  <h2 style='font-size: 24px; margin: 20px 0;'>Debian LXC</h2>\n\n  <p style='margin: 16px 0;'>\n    <a href='https://ko-fi.com/community_scripts' target='_blank' rel='noopener noreferrer'>\n      <img src='https://img.shields.io/badge/&#x2615;-Buy us a coffee-blue' alt='spend Coffee' />\n    </a>\n  </p>\n  \n  <span style='margin: 0 10px;'>\n    <i class=\"fa fa-github fa-fw\" style=\"color: #f5f5f5;\"></i>\n    <a href='https://github.com/community-scripts/ProxmoxVE' target='_blank' rel='noopener noreferrer' style='text-decoration: none; color: #00617f;'>GitHub</a>\n  </span>\n  <span style='margin: 0 10px;'>\n    <i class=\"fa fa-comments fa-fw\" style=\"color: #f5f5f5;\"></i>\n    <a href='https://github.com/community-scripts/ProxmoxVE/discussions' target='_blank' rel='noopener noreferrer' style='text-decoration: none; color: #00617f;'>Discussions</a>\n  </span>\n  <span style='margin: 0 10px;'>\n    <i class=\"fa fa-exclamation-circle fa-fw\" style=\"color: #f5f5f5;\"></i>\n    <a href='https://github.com/community-scripts/ProxmoxVE/issues' target='_blank' rel='noopener noreferrer' style='text-decoration: none; color: #00617f;'>Issues</a>\n  </span>\n</div>\n"
      on_boot          = false
      memory_swap      = 512
      unprivileged     = true
      protection       = false
      started          = false
      os_type          = "debian"
      network_interfaces = [
        {
          name         = "eth0"
          bridge       = "vmbr0"
          ipv4_address = "dhcp"
        }
      ]
      disks = [
        {
          datastore_id = "local-zfs"
          size         = 16
        }
      ]
      features = {
        keyctl  = true
        nesting = true
      }
    }
    "106" = {
      name             = "debian-minecraft"
      node_name        = "proxmox"
      cpu_cores        = 12
      memory_dedicated = 16384
      tags             = ["community-script", "os"]
      description      = "<div align='center'>\n  <a href='https://Helper-Scripts.com' target='_blank' rel='noopener noreferrer'>\n    <img src='https://raw.githubusercontent.com/community-scripts/ProxmoxVE/main/misc/images/logo-81x112.png' alt='Logo' style='width:81px;height:112px;'/>\n  </a>\n\n  <h2 style='font-size: 24px; margin: 20px 0;'>Debian LXC</h2>\n\n  <p style='margin: 16px 0;'>\n    <a href='https://ko-fi.com/community_scripts' target='_blank' rel='noopener noreferrer'>\n      <img src='https://img.shields.io/badge/&#x2615;-Buy us a coffee-blue' alt='spend Coffee' />\n    </a>\n  </p>\n  \n  <span style='margin: 0 10px;'>\n    <i class=\"fa fa-github fa-fw\" style=\"color: #f5f5f5;\"></i>\n    <a href='https://github.com/community-scripts/ProxmoxVE' target='_blank' rel='noopener noreferrer' style='text-decoration: none; color: #00617f;'>GitHub</a>\n  </span>\n  <span style='margin: 0 10px;'>\n    <i class=\"fa fa-comments fa-fw\" style=\"color: #f5f5f5;\"></i>\n    <a href='https://github.com/community-scripts/ProxmoxVE/discussions' target='_blank' rel='noopener noreferrer' style='text-decoration: none; color: #00617f;'>Discussions</a>\n  </span>\n  <span style='margin: 0 10px;'>\n    <i class=\"fa fa-exclamation-circle fa-fw\" style=\"color: #f5f5f5;\"></i>\n    <a href='https://github.com/community-scripts/ProxmoxVE/issues' target='_blank' rel='noopener noreferrer' style='text-decoration: none; color: #00617f;'>Issues</a>\n  </span>\n</div>\n"
      on_boot          = true
      memory_swap      = 0
      unprivileged     = true
      protection       = false
      started          = true
      os_type          = "debian"
      network_interfaces = [
        {
          name         = "eth0"
          bridge       = "vmbr1"
          ipv4_address = "10.17.2.30/22"
          ipv4_gateway = "10.17.0.1"
        }
      ]
      disks = [
        {
          datastore_id = "local-zfs"
          size         = 50
        }
      ]
      mount_points = [
        {
          volume = "local-ssd:vm-106-disk-0"
          path   = "/mnt/ssd-budamcinf"
          size   = "32G"
          backup = true
        }
      ]
      features = {
        keyctl  = true
        nesting = true
      }
    }
    "107" = {
      name             = "debian-qbittorrent"
      node_name        = "proxmox"
      cpu_cores        = 2
      memory_dedicated = 2048
      tags             = ["community-script", "torrent"]
      description      = "<div align='center'>\n  <a href='https://Helper-Scripts.com' target='_blank' rel='noopener noreferrer'>\n    <img src='https://raw.githubusercontent.com/community-scripts/ProxmoxVE/main/misc/images/logo-81x112.png' alt='Logo' style='width:81px;height:112px;'/>\n  </a>\n\n  <h2 style='font-size: 24px; margin: 20px 0;'>qBittorrent LXC</h2>\n\n  <p style='margin: 16px 0;'>\n    <a href='https://ko-fi.com/community_scripts' target='_blank' rel='noopener noreferrer'>\n      <img src='https://img.shields.io/badge/&#x2615;-Buy us a coffee-blue' alt='spend Coffee' />\n    </a>\n  </p>\n\n  <span style='margin: 0 10px;'>\n    <i class=\"fa fa-github fa-fw\" style=\"color: #f5f5f5;\"></i>\n    <a href='https://github.com/community-scripts/ProxmoxVE' target='_blank' rel='noopener noreferrer' style='text-decoration: none; color: #00617f;'>GitHub</a>\n  </span>\n  <span style='margin: 0 10px;'>\n    <i class=\"fa fa-comments fa-fw\" style=\"color: #f5f5f5;\"></i>\n    <a href='https://github.com/community-scripts/ProxmoxVE/discussions' target='_blank' rel='noopener noreferrer' style='text-decoration: none; color: #00617f;'>Discussions</a>\n  </span>\n  <span style='margin: 0 10px;'>\n    <i class=\"fa fa-exclamation-circle fa-fw\" style=\"color: #f5f5f5;\"></i>\n    <a href='https://github.com/community-scripts/ProxmoxVE/issues' target='_blank' rel='noopener noreferrer' style='text-decoration: none; color: #00617f;'>Issues</a>\n  </span>\n</div>\n"
      on_boot          = true
      memory_swap      = 512
      unprivileged     = true
      protection       = false
      started          = true
      os_type          = "debian"
      network_interfaces = [
        {
          name         = "eth0"
          bridge       = "vmbr1"
          ipv4_address = "10.17.1.201/22"
          ipv4_gateway = "10.17.0.1"
          mtu          = 1500
        }
      ]
      disks = [
        {
          datastore_id = "local-zfs"
          size         = 192
        }
      ]
      features = {
        keyctl  = true
        nesting = true
      }
    }
    "108" = {
      name             = "debian-hytale"
      node_name        = "proxmox"
      cpu_cores        = 8
      memory_dedicated = 8192
      tags             = ["community-script", "os"]
      description      = "<div align='center'>\n  <a href='https://Helper-Scripts.com' target='_blank' rel='noopener noreferrer'>\n    <img src='https://raw.githubusercontent.com/community-scripts/ProxmoxVE/main/misc/images/logo-81x112.png' alt='Logo' style='width:81px;height:112px;'/>\n  </a>\n\n  <h2 style='font-size: 24px; margin: 20px 0;'>Debian LXC</h2>\n\n  <p style='margin: 16px 0;'>\n    <a href='https://ko-fi.com/community_scripts' target='_blank' rel='noopener noreferrer'>\n      <img src='https://img.shields.io/badge/&#x2615;-Buy us a coffee-blue' alt='spend Coffee' />\n    </a>\n  </p>\n\n  <span style='margin: 0 10px;'>\n    <i class=\"fa fa-github fa-fw\" style=\"color: #f5f5f5;\"></i>\n    <a href='https://github.com/community-scripts/ProxmoxVE' target='_blank' rel='noopener noreferrer' style='text-decoration: none; color: #00617f;'>GitHub</a>\n  </span>\n  <span style='margin: 0 10px;'>\n    <i class=\"fa fa-comments fa-fw\" style=\"color: #f5f5f5;\"></i>\n    <a href='https://github.com/community-scripts/ProxmoxVE/discussions' target='_blank' rel='noopener noreferrer' style='text-decoration: none; color: #00617f;'>Discussions</a>\n  </span>\n  <span style='margin: 0 10px;'>\n    <i class=\"fa fa-exclamation-circle fa-fw\" style=\"color: #f5f5f5;\"></i>\n    <a href='https://github.com/community-scripts/ProxmoxVE/issues' target='_blank' rel='noopener noreferrer' style='text-decoration: none; color: #00617f;'>Issues</a>\n  </span>\n</div>\n"
      on_boot          = true
      memory_swap      = 512
      unprivileged     = true
      protection       = false
      started          = false
      os_type          = "debian"
      network_interfaces = [
        {
          name         = "eth0"
          bridge       = "vmbr1"
          ipv4_address = "10.17.2.40/22"
          ipv4_gateway = "10.17.0.1"
        }
      ]
      disks = [
        {
          datastore_id = "local-zfs"
          size         = 8
        }
      ]
      mount_points = [
        {
          volume = "local-ssd:vm-108-disk-0"
          path   = "/mnt/budahytale-ssd"
          size   = "32G"
          backup = true
        }
      ]
      features = {
        keyctl  = true
        nesting = true
      }
    }
    "900" = {
      name             = "postgresql"
      node_name        = "proxmox"
      cpu_cores        = 4
      memory_dedicated = 4096
      tags             = ["database", "debian"]
      description      = "<div align='center'>\n  <a href='https://community-scripts.org' target='_blank' rel='noopener noreferrer'>\n    <img src='https://raw.githubusercontent.com/community-scripts/ProxmoxVE/main/misc/images/logo-81x112.png' alt='Logo' style='width:81px;height:112px;'/>\n  </a>\n\n  <h2 style='font-size: 24px; margin: 20px 0;'>PostgreSQL LXC</h2>\n\n  <p style='margin: 16px 0;'>\n    <a href='https://community-scripts.org/donate' target='_blank' rel='noopener noreferrer'>\n      <img src='https://img.shields.io/badge/❤️-Sponsoring%20%26%20Donations-FF5E5B' alt='Sponsoring and donations' />\n    </a>\n  </p>\n\n  <p style='margin: 12px 0;'>\n    <a href='https://community-scripts.org/scripts/postgresql' target='_blank' rel='noopener noreferrer'>\n      <img src='https://img.shields.io/badge/📦-Open%20Script%20Page-00617f' alt='Open script page' />\n    </a>\n  </p>\n\n  <span style='margin: 0 10px;'>\n    <i class=\"fa fa-github fa-fw\" style=\"color: #f5f5f5;\"></i>\n    <a href='https://github.com/community-scripts/ProxmoxVE' target='_blank' rel='noopener noreferrer' style='text-decoration: none; color: #00617f;'>GitHub</a>\n  </span>\n  <span style='margin: 0 10px;'>\n    <i class=\"fa fa-comments fa-fw\" style=\"color: #f5f5f5;\"></i>\n    <a href='https://github.com/community-scripts/ProxmoxVE/discussions' target='_blank' rel='noopener noreferrer' style='text-decoration: none; color: #00617f;'>Discussions</a>\n  </span>\n  <span style='margin: 0 10px;'>\n    <i class=\"fa fa-exclamation-circle fa-fw\" style=\"color: #f5f5f5;\"></i>\n    <a href='https://github.com/community-scripts/ProxmoxVE/issues' target='_blank' rel='noopener noreferrer' style='text-decoration: none; color: #00617f;'>Issues</a>\n  </span>\n</div>\n"
      on_boot          = true
      memory_swap      = 512
      unprivileged     = true
      protection       = true
      started          = true
      os_type          = "debian"
      network_interfaces = [
        {
          name         = "eth0"
          bridge       = "vmbr1"
          ipv4_address = "10.17.1.90/22"
          ipv4_gateway = "10.17.0.1"
        }
      ]
      disks = [
        {
          datastore_id = "local-zfs"
          size         = 20
        }
      ]
      features = {
        keyctl  = true
        nesting = true
      }
    }
    "901" = {
      name             = "valkey"
      node_name        = "proxmox"
      cpu_cores        = 4
      memory_dedicated = 4096
      tags             = ["database", "debian"]
      description      = "<div align='center'>\n  <a href='https://community-scripts.org' target='_blank' rel='noopener noreferrer'>\n    <img src='https://raw.githubusercontent.com/community-scripts/ProxmoxVE/main/misc/images/logo-81x112.png' alt='Logo' style='width:81px;height:112px;'/>\n  </a>\n\n  <h2 style='font-size: 24px; margin: 20px 0;'>Valkey LXC</h2>\n\n  <p style='margin: 16px 0;'>\n    <a href='https://community-scripts.org/donate' target='_blank' rel='noopener noreferrer'>\n      <img src='https://img.shields.io/badge/❤️-Sponsoring%20%26%20Donations-FF5E5B' alt='Sponsoring and donations' />\n    </a>\n  </p>\n\n  <p style='margin: 12px 0;'>\n    <a href='https://community-scripts.org/scripts/valkey' target='_blank' rel='noopener noreferrer'>\n      <img src='https://img.shields.io/badge/📦-Open%20Script%20Page-00617f' alt='Open script page' />\n    </a>\n  </p>\n\n  <span style='margin: 0 10px;'>\n    <i class=\"fa fa-github fa-fw\" style=\"color: #f5f5f5;\"></i>\n    <a href='https://github.com/community-scripts/ProxmoxVE' target='_blank' rel='noopener noreferrer' style='text-decoration: none; color: #00617f;'>GitHub</a>\n  </span>\n  <span style='margin: 0 10px;'>\n    <i class=\"fa fa-comments fa-fw\" style=\"color: #f5f5f5;\"></i>\n    <a href='https://github.com/community-scripts/ProxmoxVE/discussions' target='_blank' rel='noopener noreferrer' style='text-decoration: none; color: #00617f;'>Discussions</a>\n  </span>\n  <span style='margin: 0 10px;'>\n    <i class=\"fa fa-exclamation-circle fa-fw\" style=\"color: #f5f5f5;\"></i>\n    <a href='https://github.com/community-scripts/ProxmoxVE/issues' target='_blank' rel='noopener noreferrer' style='text-decoration: none; color: #00617f;'>Issues</a>\n  </span>\n</div>\n"
      on_boot          = true
      memory_swap      = 512
      unprivileged     = true
      protection       = true
      started          = true
      os_type          = "debian"
      network_interfaces = [
        {
          name         = "eth0"
          bridge       = "vmbr1"
          ipv4_address = "10.17.1.91/22"
          ipv4_gateway = "10.17.0.1"
        }
      ]
      disks = [
        {
          datastore_id = "local-ssd"
          size         = 4
        }
      ]
      features = {
        keyctl  = true
        nesting = true
      }
    }
  }
}
