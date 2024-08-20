# HoangTheBoss' smol homelab

## Summary

I'm running various services on a DIY NAS with TrueNAS Scale and running routers and APs with OpenWRT. Services are mostly managed through Portainer with Docker Compose, and some scripts run directly on the host. A UPS is planned for the server to ensure resilience and uptime.

## Server~~s~~

- TrueNAS Scale
  - Intel Core i5-3470 CPU @ 3.20GHz (4C/4T)
  - 16GB DDR3 (2 x 8GB DDR3)
  - Boot: Unknown 160GB HDD (OOS160G16M)
  - HDD1: Seagate BarraCuda 500GB SATA3 7200RPM (ST500DM002)
  - HDD2: WD RE Enterprise 500GB SATA3 7200RPM (WD5003ABYZ)
  - HDD3: WD Purple 2TB SATA3 5400RPM (WDC WD20PURX)

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

- Replace the current server hardware with a newer, more efficient and powerful AMD Ryzen system
- Run Proxmox on the new system and move TrueNAS to a VM, massively extends the potential of my homelab
- Get a HBA card and drives, optimally dozens of terabytes passed through to TrueNAS
- Migrate to 2.5GbE with an aftermarket 2.5GbE ONU and OPNSense x86 router, 2.5GbE switches and NICs
