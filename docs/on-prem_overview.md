# On-Premises Overview

## Overview and Objectives

**Purpose of On-Premises Infrastructure**: The on-premises infrastructure provides essential network and server resources required for daily operations. It includes virtualization, storage, network management, and security services to ensure the reliable and secure functioning of internal services.

**Key Objectives**:
- Ensure high availability and performance
- Maintain robust security measures
- Facilitate seamless integration with cloud resources

## Hardware Inventory

### Network Devices

- **Router/Firewall**: 
  - Model: Netgate 4100
  - Software: pfSense
  - Role: Main gateway, firewall, and VPN endpoint

- **Switches**: 
  - Model: TP-Link Layer 2+3 24-port 1GbE switches (2 units)
  - Role: Switching and VLAN segmentation

### Servers

- **Server 1**:
  - **Hardware**: Dell PowerEdge R740
  - **CPU**: Intel Xeon Silver 4214
  - **RAM**: 64GB DDR4
  - **Storage**: 2TB NVMe SSD
  - **Role**: Virtualization host
  - **Operating System**: Proxmox VE

- **Server 2**:
  - **Hardware**: Dell PowerEdge R740
  - **CPU**: Intel Xeon Silver 4214
  - **RAM**: 64GB DDR4
  - **Storage**: 2TB NVMe SSD
  - **Role**: Virtualization host
  - **Operating System**: Proxmox VE

### Storage

- **NAS**: 
  - Model: QNAP TS-453D
  - Storage Capacity: 16TB
  - Configuration: RAID 5
  - Role: Centralized storage and backup repository

## Network Configuration

### Subnets and VLANs

- **VLAN 1**: Default/Management
  - Subnet: 10.1.1.0/24

- **VLAN 20**: Servers
  - Subnet: 10.20.20.0/24

- **VLAN 30**: Users
  - Subnet: 10.30.30.0/24

- **VLAN 40**: IoT
  - Subnet: 10.40.40.0/24

- **VLAN 50**: Guests
  - Subnet: 10.50.50.0/24

- **VLAN 60**: DMZ
  - Subnet: 10.60.60.0/24

### IP Addressing

- **Static IP Assignments**:
  - Management interfaces, servers, and critical infrastructure devices
  - DHCP for users, IoT, and guest devices

## Virtualization

### Proxmox VE

- **Purpose**: Host virtual machines for various services
- **Features**:
  - High availability clusters
  - Live migration
  - Integrated backup solutions

- **Configuration**:
  - Cluster of 2 servers
  - Shared storage on NAS for VM images and backups

### Virtual Machines

- **Web Server**:
  - **Host**: Server 1
  - **VLAN**: 20 (Servers)
  - **IP Address**: 10.20.20.10
  - **Operating System**: Ubuntu 22.04
  - **Services**: Nginx, PHP

- **Database Server**:
  - **Host**: Server 2
  - **VLAN**: 20 (Servers)
  - **IP Address**: 10.20.20.20
  - **Operating System**: Ubuntu 22.04
  - **Services**: MySQL, PostgreSQL

- **File Server**:
  - **Host**: Server 2
  - **VLAN**: 20 (Servers)
  - **IP Address**: 10.20.20.30
  - **Operating System**: Ubuntu 22.04
  - **Services**: Samba, NFS

## Network Services

### pfSense Firewall

- **Purpose**: Provide firewall, routing, and VPN services
- **Configuration**:
  - Stateful packet inspection
  - VPN endpoints for site-to-site and remote access
  - VLAN routing and segmentation

### DNS

- **Purpose**: Resolve domain names to IP addresses
- **Configuration**:
  - Internal DNS server for local resolution
  - Forwarding to external DNS servers for public domains

### DHCP

- **Purpose**: Automatically assign IP addresses to devices
- **Configuration**:
  - DHCP scopes for VLANs 30, 40, and 50
  - Reservations for critical infrastructure

### NTP

- **Purpose**: Synchronize time across network devices
- **Configuration**:
  - Internal NTP server
  - Synchronization with public NTP servers

## Monitoring and Management

### Monitoring Tools

- **Prometheus**: For collecting and storing metrics
- **Grafana**: For visualizing metrics and creating dashboards
- **Loki**: For log aggregation and analysis

### Management

- **Proxmox VE**: Web-based management interface for virtualization
- **pfSense**: Web-based management interface for firewall and routing
- **NAS**: QNAP QTS for storage management

## Backup and Recovery

### Backup Solutions

- **Primary Backup**: 
  - Tool: Veeam Backup & Replication
  - Schedule: Daily incremental, weekly full backups
  - Storage: Backups stored on NAS and Azure Blob Storage

- **Secondary Backup**:
  - Tool: Rsync for local file synchronization
  - Schedule: Hourly synchronization to secondary NAS

### Recovery Plans

- Detailed recovery procedures for each type of server and service
- Regular testing of backup integrity and recovery processes

## Security Measures

### Access Control

- **Network Segmentation**: Using VLANs to isolate different types of traffic
- **Role-Based Access Control (RBAC)**: For server and network device management
- **SSH Key-Based Authentication**: For secure access to servers

### Firewall Rules

- **Inbound and Outbound Rules**: Restrictive rules to minimize attack surface
- **VPN Security**: Strong encryption for site-to-site and remote access VPNs

## Scalability and Future Plans

### Scalability Plans

- Adding additional servers to Proxmox cluster as needed
- Expanding storage capacity with additional NAS devices
- Implementing load balancers for web and application servers

### Future Upgrades

- Upgrading network devices to support higher bandwidth
- Integrating with more advanced monitoring and automation tools
- Enhancing backup solutions with faster recovery times

---

This document provides an overview of the on-premises infrastructure, including hardware, network configuration, virtualization, services, and management practices. Further details will be added as the environment evolves and new requirements are identified.
