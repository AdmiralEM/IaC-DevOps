# Azure Overview

## Overview and Objectives

**Purpose of Azure Infrastructure**: The Azure infrastructure is designed to extend the on-premises network, providing additional resources, scalability, and reliability for critical services. It includes virtual machines, networking components, and various services integrated with the on-premises environment.

**Key Objectives**:
- Enhance scalability and flexibility
- Provide reliable and secure cloud-based services
- Seamless integration with on-premises infrastructure

## Azure Resource Structure

### Resource Groups

- **Resource Group 1**: `rg-network`
  - **Purpose**: Contains all networking-related resources
  - **Resources**: Virtual network, subnets, network security groups

- **Resource Group 2**: `rg-compute`
  - **Purpose**: Contains virtual machines and related resources
  - **Resources**: VMs, VM scale sets, availability sets

- **Resource Group 3**: `rg-storage`
  - **Purpose**: Contains storage accounts and backup resources
  - **Resources**: Azure Storage accounts, Azure Backup

- **Resource Group 4**: `rg-databases`
  - **Purpose**: Contains database services
  - **Resources**: Azure SQL Database, Cosmos DB

### Virtual Networks and Subnets

- **Virtual Network**: `vnet-main`
  - **Address Space**: 10.100.0.0/16
  - **Subnets**:
    - **Subnet 1**: `subnet-web` (10.100.1.0/24)
    - **Subnet 2**: `subnet-app` (10.100.2.0/24)
    - **Subnet 3**: `subnet-db` (10.100.3.0/24)
    - **Subnet 4**: `subnet-management` (10.100.4.0/24)

### Network Security Groups (NSGs)

- **NSG-web**:
  - **Purpose**: Protects web servers
  - **Rules**: Allow HTTP/HTTPS traffic, deny all others

- **NSG-app**:
  - **Purpose**: Protects application servers
  - **Rules**: Allow specific application traffic, deny all others

- **NSG-db**:
  - **Purpose**: Protects database servers
  - **Rules**: Allow database traffic, deny all others

### Virtual Machines

- **VM 1**: `vm-web-01`
  - **Resource Group**: `rg-compute`
  - **Subnet**: `subnet-web`
  - **Size**: Standard B2s
  - **Operating System**: Ubuntu 22.04
  - **Purpose**: Hosts web applications

- **VM 2**: `vm-app-01`
  - **Resource Group**: `rg-compute`
  - **Subnet**: `subnet-app`
  - **Size**: Standard B2s
  - **Operating System**: Ubuntu 22.04
  - **Purpose**: Hosts application services

- **VM 3**: `vm-db-01`
  - **Resource Group**: `rg-compute`
  - **Subnet**: `subnet-db`
  - **Size**: Standard B2ms
  - **Operating System**: Ubuntu 22.04
  - **Purpose**: Hosts database services

### Storage Accounts

- **Storage Account 1**: `storageprimary`
  - **Resource Group**: `rg-storage`
  - **Purpose**: Primary storage account for VMs and backups
  - **Replication**: Geo-redundant storage (GRS)

- **Storage Account 2**: `storagesecondary`
  - **Resource Group**: `rg-storage`
  - **Purpose**: Secondary storage for log files and diagnostics
  - **Replication**: Locally-redundant storage (LRS)

### Databases

- **Azure SQL Database**: `sqldb-main`
  - **Resource Group**: `rg-databases`
  - **Purpose**: Main SQL database for application data
  - **Performance Tier**: Standard S3

- **Cosmos DB**: `cosmosdb-main`
  - **Resource Group**: `rg-databases`
  - **Purpose**: NoSQL database for scalable and fast access
  - **API**: SQL (DocumentDB)

## Site-to-Site VPN Configuration

- **Purpose**: Securely connect the on-premises network to the Azure virtual network.
- **VPN Gateway**: `vpn-gateway`
  - **Resource Group**: `rg-network`
  - **Gateway Type**: VPN
  - **SKU**: VpnGw1
  - **Configuration**: Site-to-site VPN with IPsec

- **Local Network Gateway**: `local-gateway`
  - **Resource Group**: `rg-network`
  - **IP Address**: Public IP of the on-premises gateway
  - **Address Space**: On-premises address ranges

## Backup and Disaster Recovery

- **Backup Solution**: Azure Backup
  - **Vault**: `backup-vault`
  - **Resource Group**: `rg-storage`
  - **Configuration**: Daily backups, with 30-day retention

- **Disaster Recovery**: Azure Site Recovery
  - **Vault**: `dr-vault`
  - **Resource Group**: `rg-storage`
  - **Configuration**: Replication of critical VMs to a secondary region

## Monitoring and Management

- **Monitoring Tools**:
  - **Azure Monitor**: For collecting and analyzing telemetry data
  - **Log Analytics**: For querying and analyzing logs

- **Alerting**: Configured for critical metrics and logs
  - **Email Alerts**: Sent to admin team for critical issues
  - **Dashboard**: Grafana integrated with Azure Monitor for visualization

## Security Measures

- **Identity and Access Management**:
  - **Azure AD**: For managing user access and identities
  - **Role-Based Access Control (RBAC)**: To enforce least privilege access

- **Security Center**:
  - **Configuration**: Monitoring and recommendations for securing Azure resources
  - **Compliance**: Ensures resources comply with security policies

- **Network Security**:
  - **NSGs**: Applied to subnets and NICs to control traffic flow
  - **DDoS Protection**: Standard protection enabled for critical resources

## Scalability and Future Plans

- **Scalability Plans**:
  - Implement Azure VM Scale Sets for auto-scaling
  - Utilize Azure Kubernetes Service (AKS) for container orchestration

- **Future Upgrades**:
  - Integrate Azure DevOps for CI/CD pipelines
  - Explore Azure Functions for serverless computing

---

This document provides an overview of the Azure infrastructure, including resource structure, configurations, and management practices. Further details will be added as the environment evolves and new requirements are identified.

