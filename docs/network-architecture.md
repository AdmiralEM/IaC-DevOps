# Network Overview

## Overview and Objectives

**Purpose of the Network**: A small business network with VLANs for servers, users, and guests. The network includes in-office Wi-Fi, a site-to-site (S2S) VPN to Azure for some services, and a NAS for main data repositories.

**Key Objectives**:
- Usability
- Security
- Reliability

## Network Topology

**Diagram**: *[Diagram to be added]*

**Topology Description**: The network topology consists of a LAN with a SAN. VLANs are used to segment different types of traffic for security and management.

## Network Components

### Devices

- **Router/Firewall**: 
  - Model: Netgate 4100
  - Software: pfSense
  - Role: Main gateway, firewall, and VPN endpoint

- **Switches**: 
  - Model: TP-Link Layer 2+3 24-port 1GbE switches (2 units)
  - Role: Switching and VLAN segmentation

- **VM Servers**: 
  - Quantity: 2
  - Role: Hosting virtual machines for various services

### Connections

- **WAN**:
  - ISP: Verizon Business
  - Bandwidth: 1 Gbps

- **LAN**:
  - Subnet: 10.1.1.0/24 for VLAN 1 (management)

- **VLANs**:
  - VLAN 1: Default/Management (10.1.1.0/24)
  - VLAN 20: Servers (10.20.20.0/24)
  - VLAN 30: Users (10.30.30.0/24)
  - VLAN 40: IoT (10.40.40.0/24)
  - VLAN 50: Guests (10.50.50.0/24)
  - VLAN 60: DMZ (10.60.60.0/24)

## IP Addressing Scheme

- **IP Ranges**:
  - VLAN 1: 10.1.1.0/24
  - VLAN 20: 10.20.20.0/24
  - VLAN 30: 10.30.30.0/24
  - VLAN 40: 10.40.40.0/24
  - VLAN 50: 10.50.50.0/24
  - VLAN 60: 10.60.60.0/24

- **Static IP Assignments**:
  - Servers, management, and DMZ VLANs only.

- **DHCP Configurations**:
  - DHCP enabled on users, IoT, and guest VLANs.

## Security Measures

- **Firewalls**: *[TBD]*

- **VPN**:
  - Site-to-Site VPN to Azure
  - Remote access VPN for users

- **Access Control**: *[TBD]*

## Network Services

- **DNS**:
  - Configuration of DNS servers and zones.

- **DHCP**:
  - DHCP server configuration and lease management.

- **NTP**:
  - Network Time Protocol settings and servers.

## Monitoring and Management

- **Monitoring Tools**:
  - Prometheus
  - Grafana
  - Loki

- **Logging**:
  - Loki for centralized logging.

- **SNMP**:
  - SNMP v2 for network monitoring.

## Backup and Recovery

- **Backup Solutions**:
  - SAN with cloud (Azure) backup.

- **Recovery Plans**: *[TBD]*

## Network Policies and Procedures

- **Usage Policies**: *[TBD]*

- **Maintenance Procedures**: *[TBD]*

## Scalability and Future Plans

- **Scalability Plans**: *[TBD]*

- **Future Upgrades**: *[TBD]*

---

This document provides an overview of the network setup, including its components, security measures, and services. Further details will be added as the network evolves and new requirements are identified.
