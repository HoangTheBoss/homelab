# HoangTheBoss' smol homelab

![linuxmirror-caddy-docker](https://github.com/HoangTheBoss/homelab/actions/workflows/linuxmirror-caddy-docker.yml/badge.svg)
![jmusicbot-docker](https://github.com/HoangTheBoss/homelab/actions/workflows/jmusicbot-docker.yml/badge.svg)
![tidal-downloader-docker](https://github.com/HoangTheBoss/homelab/actions/workflows/tidal-downloader-docker.yml/badge.svg)

## Summary

I'm runing some services on my DIY NAS (currently running OMV6), with a Xiaomi router running Padavan firmware.

Most service is running as a Docker Stack (docker-compose) with Portainer Free Enterprise License, only a few is running on the host. Currently no VM.

Planning to get more APs and UPSes.

## Servers

- HTB-NAS
  - Intel Pentium G645 @ 2.90GHz
  - 4GB DDR3 (2 x 2GB DDR3, used 2 of 2 slots)
  - Boot: SanDisk 32GB USB 3.0 Thumb Drive
  - HDD1: Seagate BarraCuda 500GB SATA3 7200RPM (ST500DM002)
  - HDD2: WD RE Enterprise 500GB SATA3 7200RPM (WD5003ABYZ)

## Router

- Xiaomi Mi WiFi R3G v2 with Padavan Firmware

## ISP

- FPT Telecom FTTH, about 160Mbps, PPPoE.

## Software

- OpenMediaVault for a NAS, with...

- Docker and Portainer, hosting...

- An Arch Linux mirror using Caddy File Server

- A WireGuard VPN Server

- An Adguard Home DNS Server

- And more services to be documented...

# 
