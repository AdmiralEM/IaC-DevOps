# Server Overview

## Overview and Objectives

**Purpose of the Servers**: The servers in this network are designed to provide essential services such as application hosting, database management, file storage, and more. They are segmented into different VLANs for improved security and management.

**Key Objectives**:
- High availability and reliability
- Scalability to meet future needs
- Enhanced security and isolation of critical services

## Server Inventory

### Virtual Machine (VM) Servers

- **Server 1**:
  - **Hardware**: Dell PowerEdge R740
  - **CPU**: Intel Xeon Silver 4214
  - **RAM**: 64GB DDR4
  - **Storage**: 2TB NVMe SSD
  - **Role**: Hosting VMs for application and web services
  - **Operating System**: Proxmox VE

- **Server 2**:
  - **Hardware**: Dell PowerEdge R740
  - **CPU**: Intel Xeon Silver 4214
  - **RAM**: 64GB DDR4
  - **Storage**: 2TB NVMe SSD
  - **Role**: Hosting VMs for database and storage services
  - **Operating System**: Proxmox VE

## Virtual Machines and Roles

### Web and Application Servers

- **Web Server 1**:
  - **VM Host**: Server 1
  - **VLAN**: 20 (Servers)
  - **IP Address**: 10.20.20.10
  - **Operating System**: Ubuntu 22.04
  - **Services**: Nginx, PHP, Node.js

- **Application Server 1**:
  - **VM Host**: Server 1
  - **VLAN**: 20 (Servers)
  - **IP Address**: 10.20.20.11
  - **Operating System**: Ubuntu 22.04
  - **Services**: Tomcat, Java

### Database Servers

- **Database Server 1**:
  - **VM Host**: Server 2
  - **VLAN**: 20 (Servers)
  - **IP Address**: 10.20.20.20
  - **Operating System**: Ubuntu 22.04
  - **Services**: MySQL, PostgreSQL

### Storage and File Servers

- **File Server 1**:
  - **VM Host**: Server 2
  - **VLAN**: 20 (Servers)
  - **IP Address**: 10.20.20.30
  - **Operating System**: Ubuntu 22.04
  - **Services**: Samba, NFS

## Configuration Management

- **Tool**: Ansible
- **Playbooks**:
  - `setup_web_server.yml`: Playbook to configure web servers
  - `setup_application_server.yml`: Playbook to configure application servers
  - `setup_database_server.yml`: Playbook to configure database servers
  - `setup_file_server.yml`: Playbook to configure file servers

### Example Playbook: setup_web_server.yml

```yaml
---
- name: Configure Web Server
  hosts: webservers
  become: yes
  tasks:
    - name: Install Nginx
      apt:
        name: nginx
        state: present
    - name: Start and enable Nginx
      systemd:
        name: nginx
        state: started
        enabled: yes
    - name: Install PHP
      apt:
        name: php-fpm
        state: present
    - name: Configure Nginx to use PHP
      copy:
        src: /path/to/nginx_config
        dest: /etc/nginx/sites-available/default
      notify:
        - restart nginx

  handlers:
    - name: restart nginx
      systemd:
        name: nginx
        state: restarted
```
## Backup and Recovery

- **Backup Solutions**:
  - **Tool**: Veeam Backup & Replication
  - **Schedule**: Daily incremental, weekly full backups
  - **Storage**: Backups stored on NAS and Azure Blob Storage

- **Recovery Plans**:
  - Detailed recovery procedures for each type of server
  - Regular testing of backup integrity and recovery processes

## Monitoring and Management

- **Monitoring Tools**:
  - **Prometheus**: For real-time monitoring and alerting
  - **Grafana**: For visualization of metrics and performance
  - **Loki**: For centralized logging

- **Server Metrics Monitored**:
  - CPU usage
  - Memory usage
  - Disk I/O
  - Network traffic
  - Service availability

## Security Measures

- **Access Control**:
  - Role-based access control (RBAC) for server management
  - SSH key-based authentication
  - Regular security audits and updates

- **Firewall Rules**:
  - Restrictive inbound and outbound rules
  - Specific rules for different services and VLANs

## Scalability and Future Plans

- **Scalability Plans**:
  - Adding more VM servers as needed
  - Expanding storage solutions with additional NAS devices
  - Implementing load balancers for web and application servers

- **Future Upgrades**:
  - Upgrading server hardware to next-gen processors and more RAM
  - Implementing containerization with Kubernetes
  - Enhancing backup solutions with faster recovery times

---

This document provides an overview of the server setup, including inventory, roles, configurations, and management practices. Further details will be added as the network evolves and new requirements are identified.

