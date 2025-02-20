# HoangTheBoss' smol homelab

## Summary

I'm running various services and experimenting around on my servers with Proxmox and TrueNAS Scale. My routers and APs runs OpenWRT. 

Services are mostly managed through Portainer with Docker Compose, and some scripts run directly on the hosts. A UPS is planned for the servers to ensure resilience and uptime.

## Servers

- Proxmox
  - Intel Xeon E5-2650 v4 CPU @ 2.20GHz (12C24T)
  - 64GB DDR4 ECC (4 x 16GB RDIMM)
  - NVIDIA GeForce GTX 1650 4GB (GDDR5/75W)
  - Boot + Data: WD Blue 1TB SATA3 7200RPM (WD10EZEX)
  - Unused: Kingston A400 120GB SATA3 SSD (SA400S37120G)

- TrueNAS Scale
  - Intel Core i5-3470 CPU @ 3.20GHz (4C4T)
  - 16GB DDR3 (2 x 8GB DIMM)
  - Boot: Unknown 160GB HDD (OOS160G16M)
  - HD1: Seagate BarraCuda 500GB SATA3 7200RPM (ST500DM002)
  - HD2: WD RE Enterprise 500GB SATA3 7200RPM (WD5003ABYZ)
  - HD3: WD Purple 2TB SATA3 5400RPM (WDC WD20PURX)

## Networking

### Location 1 (Main Router Location)

- Power: Battery backup 12V
- Fiber Connection: ISP Fiber Media Converter (1GbE)
- Router: JCG Q20 with CR6608 OpenWRT Firmware:
  - Services: WireGuard VPN, AdGuardHome DNS

### Location 2 (Coverage Extension)

- Power: Battery backup 12V
- Switch: Netgear 5-port 1GbE switch
- Access Point: Xiaomi MiWiFi 3G v2 with OpenWRT (AP only)

### Bedroom (Servers, Lab, Workstation)

- Switch: Mercusys 5-port 1GbE switch
- Access Point: Xiaomi MiWiFi 3G v2 with OpenWRT (AP only)

## ISP

- Provider: FPT Telecom
- Connection: FTTH, 1 Gigabit Symmetrical (theoretical), PPPoE

## Software

- TrueNAS Scale: Network storage, Docker host
- Docker and Portainer: Container management with Portainer Free Enterprise License
- Services:
  - Caddy: Reverse Proxy/Web Server
  - Authentik: Authentication/Authorization/Identity Provider
  - NextCloud: Cloud storage, file sharing, collaboration
  - Linux Repository Mirror: Hosted using Caddy File Server,
  - Additional Services: To be documented

## Future Plans

- Replace the current servers with a newer, more efficient and powerful AMD Ryzen system
- Run Proxmox on the new system and move TrueNAS to a VM, massively extends the potential of my homelab
- Get a HBA/SATA card and drives, optimally dozens of terabytes passed through to TrueNAS
- Migrate to 2.5GbE WAN with an aftermarket 2.5GbE ONU and OPNSense x86 router, 2.5GbE switches and NICs
