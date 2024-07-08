# HoangTheBoss' smol homelab


## Summary

I'm runing some services on my DIY NAS (currently running TrueNAS Scale), with a Xiaomi router running Padavan firmware.

Most service is running as a Docker Stack (docker-compose) with Portainer Free Enterprise License, only the mirror sync and some update scripts is running on the host. Currently no VM.

Planning to get more APs and UPSes.

## Server~~s~~

- TrueNAS Scale
  - Intel Core i5-3470 CPU @ 3.20GHz (4C4T)
  - 16GB DDR3 (2 x 8GB DDR3, used 2 of 2 slots)
  - Boot: Unknown 160GB HDD (OOS160G16M)
  - HDD1: Seagate BarraCuda 500GB SATA3 7200RPM (ST500DM002)
  - HDD2: WD RE Enterprise 500GB SATA3 7200RPM (WD5003ABYZ)
  - HDD3: WD Purple 2TB SATA3 5400RPM (WDC WD20PURX)

## Networking

- ISP Fiber ONT Converter (1GbE)
- Router: Xiaomi Mi WiFi R3G v2 with Padavan Firmware
- AP: Xiaomi Mi WiFi R4A with Padavan Firmware

## ISP

- FPT Telecom FTTH, Gigabit Symmetrical, PPPoE.

## Software

- TrueNAS Scale for network storage, with...

- Docker and Portainer installed, hosting...

- Caddy as Reverse Proxy/Web Server,

- Authentik for Authentication/Authorization/Identity Provider,

- NextCloud for cloud storage, file sharing, collaboration, etc.

- A Linux repository mirror using Caddy File Server,

- A WireGuard VPN Server,

- An Adguard Home DNS Server,

- And more services to be documented...

