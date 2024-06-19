# Infrastructure-as-Code and DevOps Example Network

Welcome to the Infrastructure-as-Code (IaC) and DevOps Example Network repository. This project demonstrates a comprehensive network setup using a mix of on-premises, cloud, and hybrid infrastructure. The project includes configurations and automation scripts for network devices, servers, services, Azure infrastructure, and a Microsoft 365 tenant.

## Project Structure

This repository is organized into several directories, each focusing on different aspects of the network and its components:

- **/docs**: Contains detailed documentation for the entire project.
- **/network**: Includes network configuration files and diagrams.
- **/servers**: Contains server configuration files and automation scripts.
- **/services**: Includes service configurations and related documentation.
- **/azure**: Contains Azure-specific configurations and templates.
- **/m365**: Includes Microsoft 365 tenant configurations and related documents.
- **/on-prem**: Contains on-premises configurations and automation scripts.
- **/scripts**: General scripts for automation and setup.
- **/configs**: Configuration files for various tools and services.
- **/examples**: Example files and templates.
- **/images**: Diagrams, screenshots, and other visual aids.

## Getting Started

To get started with this project, follow the instructions provided in the respective directories. Each directory contains a README.md file with detailed steps and information on how to set up and configure the components.

### Prerequisites

Before you begin, ensure you have the following tools installed:

- Git
- Docker
- Ansible
- Terraform
- Azure CLI
- Microsoft 365 account

### Cloning the Repository

```bash
git clone https://github.com/AdmiralEM/IaC-DevOps.git
cd IaC-DevOps
```

## Directory Overview
/docs
The /docs directory contains comprehensive documentation for the entire project. It includes overviews, guidelines, and detailed explanations of each component.

/network
The /network directory includes configuration files and diagrams for setting up the network. This includes VLAN configurations, network device settings, and network diagrams.

/servers
The /servers directory contains configuration files and automation scripts for setting up servers. This includes Ansible playbooks, Docker Compose files, and server roles.

/services
The /services directory includes configurations for various services such as Nginx, DNS, and other critical services used in the network.

/azure
The /azure directory contains Terraform scripts and ARM templates for deploying Azure resources. This includes virtual machines, networking, and other Azure services.

/m365
The /m365 directory includes documentation and configuration files for setting up and managing a Microsoft 365 tenant. This covers user management, security policies, and compliance documentation.

/on-prem
The /on-prem directory contains configuration files and automation scripts for on-premises infrastructure. This includes Proxmox setup, pfSense configurations, and QNAP NAS setup.

/scripts
The /scripts directory includes various scripts for automating the setup and deployment of the network components. This includes Bash scripts for network setup and deployment scripts for servers and Azure resources.

/configs
The /configs directory contains configuration files for various tools and services used in the project. This includes configurations for pfSense, Nginx, and other tools.

/examples
The /examples directory includes example files and templates to help users understand how to use the repository. This includes example user setups and virtual machine configurations.

/images
The /images directory contains diagrams, screenshots, and other visual aids used throughout the documentation.

## Contributing
We welcome contributions to this project. Please read our CONTRIBUTING.md file for guidelines on how to contribute.

## License
This project is licensed under the MIT License. See the LICENSE file for more information.

## Contact
If you have any questions or need further assistance, feel free to open an issue or contact the repository maintainers.
