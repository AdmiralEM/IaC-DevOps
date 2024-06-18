# DHCP Setup

## Overview
This document provides detailed information on the configuration of the DHCP (Dynamic Host Configuration Protocol) service for the demo network. The DHCP server is responsible for dynamically assigning IP addresses and other network configuration parameters to devices on the network.

## Network Diagram
![Network Diagram](network-diagram.png)

## General Configuration
The DHCP server used in this demo network is the Kea DHCP server, which is integrated with pfSense.

### High-Level Setup Steps
1. Install the Kea DHCP server on pfSense.
2. Configure DHCP scopes for different VLANs.
3. Set up DHCP options (e.g., DNS servers, gateways).
4. Enable and start the DHCP service.

## DHCP Scope Configuration
### VLAN 10 (Management)
| Parameter   | Value               |
|-------------|---------------------|
| Subnet      | 10.10.10.0/24       |
| Range       | 10.10.10.100-10.10.10.200 |
| Gateway     | 10.10.10.1          |
| DNS Servers | 10.10.10.1          |

### VLAN 20 (Guest)
| Parameter   | Value               |
|-------------|---------------------|
| Subnet      | 10.10.20.0/24       |
| Range       | 10.10.20.100-10.10.20.200 |
| Gateway     | 10.10.20.1          |
| DNS Servers | 10.10.20.1          |

### VLAN 30 (IoT)
| Parameter   | Value               |
|-------------|---------------------|
| Subnet      | 10.10.30.0/24       |
| Range       | 10.10.30.100-10.10.30.200 |
| Gateway     | 10.10.30.1          |
| DNS Servers | 10.10.30.1          |

## Detailed Configuration Steps

### Install Kea DHCP Server
1. **Access the pfSense Web Interface:**
   - Open a web browser and navigate to the pfSense web interface.
   - Log in with the administrator credentials.

2. **Install Kea DHCP Server:**
   - Go to **System > Package Manager > Available Packages**.
   - Search for "Kea DHCP" and click **Install**.
   - Follow the prompts to complete the installation.

### Configure DHCP Scopes
1. **Access DHCP Configuration:**
   - Navigate to **Services > DHCP Server**.

2. **Configure VLAN 10 Scope:**
   - Select the VLAN 10 interface.
   - Enable the DHCP server on this interface.
   - Configure the DHCP range: `10.10.10.100 - 10.10.10.200`.
   - Set the gateway to `10.10.10.1`.
   - Set the DNS server to `10.10.10.1`.
   - Save the configuration.

3. **Configure VLAN 20 Scope:**
   - Select the VLAN 20 interface.
   - Enable the DHCP server on this interface.
   - Configure the DHCP range: `10.10.20.100 - 10.10.20.200`.
   - Set the gateway to `10.10.20.1`.
   - Set the DNS server to `10.10.20.1`.
   - Save the configuration.

4. **Configure VLAN 30 Scope:**
   - Select the VLAN 30 interface.
   - Enable the DHCP server on this interface.
   - Configure the DHCP range: `10.10.30.100 - 10.10.30.200`.
   - Set the gateway to `10.10.30.1`.
   - Set the DNS server to `10.10.30.1`.
   - Save the configuration.

### Set Up DHCP Options
1. **Common DHCP Options:**
   - Navigate to the **Services > DHCP Server**.
   - For each VLAN interface, set common DHCP options such as DNS servers, domain names, and lease times.
   - Example options:
     - DNS Servers: `10.10.10.1`, `10.10.20.1`, `10.10.30.1`
     - Domain Name: `example.local`
     - Lease Time: `86400` (24 hours)

### Enable and Start the DHCP Service
1. **Enable DHCP Service:**
   - Ensure the DHCP service is enabled for each VLAN interface.
   - Navigate to **Services > DHCP Server** and verify that the service is running.

## Testing and Validation
1. **Test DHCP Lease Acquisition:**
   - Connect a device to each VLAN and ensure it receives an IP address within the configured range.
   - Verify that the device receives the correct gateway and DNS server information.

2. **Test Network Connectivity:**
   - Ensure the device can communicate with other devices within the same VLAN and access external resources.

3. **Monitor DHCP Leases:**
   - Navigate to **Status > DHCP Leases** to view the list of active DHCP leases and verify correct IP address assignment.

## Troubleshooting
- **Common Issues:**
  - No IP address assigned: Check if the DHCP service is running and enabled for the correct interface.
  - Incorrect IP address assigned: Verify the DHCP scope and range configuration.

- **Resolutions:**
  - Check DHCP logs: Navigate to **Status > System Logs > DHCP** to view detailed logs and identify issues.
  - Review scope settings: Double-check the settings for each DHCP scope and ensure they are correctly configured.

## Appendices
### Reference Table: DHCP Options
| Option        | Description                       |
|---------------|-----------------------------------|
| DNS Servers   | IP addresses of DNS servers       |
| Domain Name   | Domain name for the network       |
| Lease Time    | Duration of DHCP leases in seconds|

### Example DHCP Log Entries
```text
Jun 15 12:00:00 dhcpd: DHCPDISCOVER from 00:11:22:33:44:55 via vlan10
Jun 15 12:00:01 dhcpd: DHCPOFFER on 10.10.10.101 to 00:11:22:33:44:55 via vlan10
Jun 15 12:00:02 dhcpd: DHCPREQUEST for 10.10.10.101 from 00:11:22:33:44:55 via vlan10
Jun 15 12:00:03 dhcpd: DHCPACK on 10.10.10.101 to 00:11:22:33:44:55 via vlan10
