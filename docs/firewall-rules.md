# Firewall Rules

## Overview
This document provides detailed information on the firewall rules configured for the demo network. The firewall is a critical component for network security, protecting the network by controlling incoming and outgoing traffic based on predetermined security rules.

## Network Diagram
![Network Diagram](network-diagram.png)

## General Configuration
The firewall used in this demo network is a Netgate 4100 running pfSense. It is configured to manage traffic between various VLANs and the internet.

### High-Level Setup Steps
1. Access the pfSense web interface.
2. Navigate to the **Firewall** section.
3. Configure interfaces and assign IP addresses.
4. Set up VLANs and assign them to interfaces.

## Firewall Rule Types
### Inbound Rules
These rules control the traffic coming into the network.

### Outbound Rules
These rules control the traffic going out of the network.

### NAT Rules
Network Address Translation (NAT) rules manage the translation of private IP addresses to public IP addresses and vice versa.

## Detailed Rule List
### Inbound Rules
| Rule ID | Source      | Destination   | Protocol | Port  | Action | Description                           |
|---------|-------------|---------------|----------|-------|--------|---------------------------------------|
| 1       | Any         | LAN Net       | TCP      | 80,443| Allow  | Allow HTTP/HTTPS traffic to LAN       |
| 2       | Any         | VLAN 20 Net   | ICMP     | Any   | Allow  | Allow ICMP (ping) to Guest VLAN       |
| 3       | Any         | VLAN 30 Net   | TCP      | 22    | Allow  | Allow SSH traffic to IoT VLAN         |
| 4       | Specific IP | VLAN 10 Net   | TCP      | 3389  | Allow  | Allow RDP from specific IP to Management VLAN |

### Outbound Rules
| Rule ID | Source    | Destination | Protocol | Port | Action | Description                             |
|---------|-----------|-------------|----------|------|--------|-----------------------------------------|
| 1       | LAN Net   | Any         | Any      | Any  | Allow  | Allow all outbound traffic from LAN     |
| 2       | VLAN 20   | Any         | TCP/UDP  | 53   | Allow  | Allow DNS queries from Guest VLAN       |
| 3       | VLAN 30   | Any         | TCP/UDP  | 67,68| Allow  | Allow DHCP traffic from IoT VLAN        |
| 4       | VLAN 10   | Any         | TCP      | 80,443| Allow  | Allow HTTP/HTTPS traffic from Management VLAN |

### NAT Rules
| Rule ID | Source       | Destination | Protocol | Port | NAT Type | Description                            |
|---------|--------------|-------------|----------|------|----------|----------------------------------------|
| 1       | WAN IP       | LAN Net     | TCP      | 80   | Port Forward | Forward HTTP traffic to web server      |
| 2       | WAN IP       | VLAN 20 Net | TCP      | 443  | Port Forward | Forward HTTPS traffic to web server     |
| 3       | VLAN 30 Net  | Any         | Any      | Any  | Outbound    | NAT for IoT devices to access the internet |

## Implementation Steps
1. **Access the pfSense Web Interface:**
   - Open a web browser and navigate to the pfSense web interface.
   - Log in with the administrator credentials.

2. **Configure Interfaces:**
   - Go to **Interfaces > Assignments**.
   - Assign interfaces to the appropriate VLANs.

3. **Add Firewall Rules:**
   - Navigate to **Firewall > Rules**.
   - Select the interface (e.g., LAN, VLAN 20) and click **Add**.
   - Configure the rule with the appropriate source, destination, protocol, port, and action.
   - Save and apply the changes.

4. **Configure NAT Rules:**
   - Go to **Firewall > NAT**.
   - Select the type of NAT (e.g., Port Forward, Outbound) and click **Add**.
   - Configure the NAT rule with the appropriate settings.
   - Save and apply the changes.

## Testing and Validation
1. **Test Inbound Rules:**
   - Use a device from outside the network to attempt to access services protected by inbound rules.
   - Verify that the access is allowed or denied as expected.

2. **Test Outbound Rules:**
   - Use devices within each VLAN to access external resources.
   - Ensure that outbound traffic is permitted or blocked according to the rules.

3. **Test NAT Rules:**
   - Verify that NAT rules correctly translate IP addresses and allow access as configured.

## Troubleshooting
- **Common Issues:**
  - Rule conflicts: Ensure no conflicting rules exist that override the intended rule.
  - Incorrect rule order: Firewall rules are processed top to bottom, so order matters.
  - Misconfigured interfaces: Verify that interfaces and VLANs are correctly assigned.

- **Resolutions:**
  - Check logs: Use the pfSense logs to identify and troubleshoot issues.
  - Review rule configurations: Double-check the settings for each rule.

## Appendices
### Reference Table: Ports and Protocols
| Service | Protocol | Port |
|---------|----------|------|
| HTTP    | TCP      | 80   |
| HTTPS   | TCP      | 443  |
| SSH     | TCP      | 22   |
| RDP     | TCP      | 3389 |
| DNS     | TCP/UDP  | 53   |
| DHCP    | UDP      | 67,68|

### Example Log Entries
```text
Jun 15 12:00:00 firewall pf: 00:00:00.000 rule 1/0(match): block in on vlan20 inet from any to any
Jun 15 12:00:05 firewall pf: 00:00:00.000 rule 2/0(match): pass in on vlan10 inet from 192.168.1.100 to any port 3389
