## Automated ELK Stack Deployment

The files in this repository were used to configure the network depicted below.

![alt text](https://github.com/Robo0483/My-Azure-Lab/blob/main/Images/My%20Azure%20Environment.png)

These files have been tested and used to generate a live ELK deployment on Azure. They can be used to either recreate the entire deployment pictured above. Alternatively, select portions of the install-elk.yml file may be used to install only certain pieces of it, such as Filebeat.

This document contains the following details:
- Description of the Topology
- Access Policies
- ELK Configuration
  - Beats in Use
  - Machines Being Monitored
- How to Use the Ansible Build


### Description of the Topology

The main purpose of this network is to expose a load-balanced and monitored instance of DVWA, the D*mn Vulnerable Web Application.

Load balancing ensures that the application will be highly available, in addition to restricting access to the network.

Integrating an ELK server allows users to easily monitor the vulnerable VMs for changes to the Log Files and System Metrics.

The configuration details of each machine may be found below.

| Name     | Function | IP Address | Operating System |
|----------|----------|------------|------------------|
| Jump Box | Gateway  | 10.0.0.4   | Linux            |
| Web-1    | Web App  | 10.0.0.5   | Linux            |
| Web-2    | Web App  | 10.0.0.6   | Linux            |
| DVWA-3   | Web App  | 10.0.0.8   | Linux            |
|----------|----------|------------|------------------|
| ElkStack | Monitor  | 10.1.0.4   | Linux            |

### Access Policies

The machines on the internal network are not exposed to the public Internet. 

Only the Jump Box, Elk Stack and Load Balancer machines can accept connections from the Internet. Access to this machine is only allowed from the following IP addresses:
-Jump Box      40.78.132.43
-Elk Stack     20.84.73.186
-Load Balancer 20.80.64.14

Machines within the network can only be accessed by my Personal Laptop IP:73.210.184.63.

A summary of the access policies in place can be found in the table below.

| Name and Ports           | Publicly Accessible | Allowed IP Addresses               |
|--------------------------|---------------------|------------------------------------|
| Jump Box via 22          | Yes                 | 10.0.0.5, 10.0.0.6 and 10.0.0.8    |
| ElkStack via 5601        | Yes                 | 73.210.184.63 My Local Home Network|
| ElkStack via 22          | No                  | 10.0.0.4                           |
| Web Servers via 22       | No                  | 10.0.0.4                           |
| Web Servers via 80       | No                  | 20.80.64.14 Load Balancer          |
| DVWA-Load Balancer via 80| Yes                 | 73.210.184.63 My Local Home Network|

### Elk Configuration

Ansible was used to automate configuration of the ELK machine. No configuration was performed manually, which is advantageous because it is able to save time by automating this process.

The playbook implements the following tasks:

- ... Install Docker.io and Python Module.
- ... Increase the virtual memory on the VMs.
- ... Download and Lauch the ELK Container.
- ... Enable the Ports for the ELK Container (5601, 9200, and 5044 ).
- ... Enable the Docker service and ELK service to begin upon boot. 

The following screenshot displays the result of running `docker ps` after successfully configuring the ELK instance.

![alt text](https://github.com/Robo0483/My-Azure-Lab/blob/main/Images/docker_ps_output.PNG)

### Target Machines & Beats
This ELK server is configured to monitor the following machines: 

Web-1:  10.0.0.5
Web-2:  10.0.0.6
DVWA-3: 10.0.0.8

We have installed the following Beats on these machines: 

- Filebeat 
- Metricbeat

These Beats allow us to collect the following information from each machine: Filebeat on the ELK Stack monitors the three VMs to gather log data and Metricbeat monitors for metric data on the same three VMs within the Azure Network. 

Here's an example of Kibana Running

![alt text](https://github.com/Robo0483/My-Azure-Lab/blob/main/Images/docker_ps_output.PNG)

### Using the Playbook
In order to use the playbook, you will need to have an Ansible control node already configured. Assuming you have such a control node provisioned: 

SSH into the control node and follow the steps below:

- Copy the yml file (install-elk.yml) to /etc/ansible directory.
- Update the hosts file to include the (Elk) section and update in, in order to include all of the IPs in the network needed. 
- Run the playbook, and navigate to the following URL http://elk_server_ip:5601 in order to check that the installation worked as expected.
