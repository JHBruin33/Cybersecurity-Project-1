## Automated ELK Stack Deployment

The files in this repository were used to configure the network depicted below.

https://github.com/JHBruin33/Cybersecurity-Project-1/tree/main/Diagrams



These files have been tested and used to generate a live ELK deployment on Azure. They can be used to either recreate the entire deployment pictured above. Alternatively, select portions of the Azure Cloud Environment file may be used to install only certain pieces of it, such as Filebeat.

  - https://github.com/JHBruin33/Cybersecurity-Project-1/blob/main/Ansible/roles/filebeat-playbook.yml

This document contains the following details:
- Description of the Topologu
- Access Policies
- ELK Configuration
  - Beats in Use
  - Machines Being Monitored
- How to Use the Ansible Build


### Description of the Topology

The main purpose of this network is to expose a load-balanced and monitored instance of DVWA, the D*mn Vulnerable Web Application.

Load balancing ensures that the application will be highly reliable, in addition to restricting access to the network.
- Load Balancers protect against DoS attacks. The primary advantage of the jump box is that it limits access to only one administrator. 

Integrating an ELK server allows users to easily monitor the vulnerable VMs for changes to the machines and system logs.
- Filebeat helps generate and organize log files to send to Logstash and Elasticsearch. Specifically, it logs information about the file system, including which files have changed and when.
- Metricbeat is a lightweight shipper that you can install on your servers to periodically collect metrics from the operating system and from services running on the server. Metricbeat takes the metrics and statistics that it collects and ships them to the output that you specify, such as Elasticsearch or Logstash.

The configuration details of each machine may be found below:


| Name     | Function              | IP Address | Operating System |
|----------|-----------------------|------------|------------------|
| Jump Box | Gateway               | 10.0.0.1   | Linux            |
| Web-1    | DVWA Containers       | 10.0.0.13  | Linux            |
| Web-2    | DVWA Containers       | 10.0.0.12  | Linux            |
| Web-3    | DVWA Containers       | 10.0.0.14  | Linux            |
| ELK      | Configuration VM      | 10.1.0.5   | Linux            |

### Access Policies

The machines on the internal network are not exposed to the public Internet. 

Only the Jump Box machine can accept connections from the Internet. Access to this machine is only allowed from the following IP addresses:
- 104.35.139.127 - my personal machine 

Machines within the network can only be accessed by DVWA Container in the Jump Box.
- The only machines that can access the ELK server are 104.35.139.127 - my personal machine, and the Jump Box VM at IP 10.0.0.9, through a peering connection.

A summary of the access policies in place can be found in the table below.

| Name                | Publicly Accessible | Allowed IP Addresses    |
|---------------------|---------------------|-------------------------|
| Jump Box Provisioner| Yes                 | 10.0.0.9, 104.35.139.127|
| Web-1               | No                  | 10.0.0.9                |
| Web-2               | No                  | 10.0.0.9                |
| Web-3               | No                  | 10.0.0.9                |
| ELK                 | No                  | 10.0.0.9, 104.35.139.127|

### Elk Configuration

Ansible was used to automate configuration of the ELK machine. No configuration was performed manually, which is advantageous because...
- There is no need to install any additional software, or firewall ports, on the client systems that you want to automate. Additionally, you do not need to set up any separate management structure.

The playbook implements the following tasks:
- Install Docker
- Downlaod Image
- Congifure containter
- Create playbook to install container with Docker, as well as Filebeat and Metricbeat
- Run playbook to launch container

The following screenshot displays the result of running `docker ps` after successfully configuring the ELK instance.

![TODO: Update the path with the name of your screenshot of docker ps output](Images/docker_ps_output.png)

### Target Machines & Beats
This ELK server is configured to monitor the following machines:
- 10.0.0.13 Web-1
- 10.0.0.12 Web-2
- 10.0.0.14 Web-3

We have installed the following Beats on these machines:
- Filebeat 
- Metricbeat

These Beats allow us to collect the following information from each machine:
- Filebeat monitors the log files or locations that you specify, collects log events, and forwards them either to Elasticsearch or Logstash for indexing. When Filebeat starts logging, it will represent data such as system log events in a dashboard
- Metricbeat periodically collect metrics from the operating system and from services running on the server. Metricbeat takes the metrics and statistics that it collects and ships them to the output that you specify, such as Elasticsearch or Logstash. Metricbeat will display information such as container CPU usage as follows

### Using the Playbook
In order to use the playbook, you will need to have an Ansible control node already configured. Assuming you have such a control node provisioned: 

SSH into the control node and follow the steps below:
- Copy the filebeat-playbook.yml file to /etc/ansible/roles.
- Update the filebeat-config.yml file to include the ELK server private IP in lines 1106 and 1806.
- Run the filebeat-playbook.yml playbook, and navigate to the kibana page at [ELK public IP]/app/kibana to check that the installation worked as expected.

_TODO: Answer the following questions to fill in the blanks:_
- _Which file is the playbook? Where do you copy it?_
- _Which file do you update to make Ansible run the playbook on a specific machine? How do I specify which machine to install the ELK server on versus which to install Filebeat on?_
- _Which URL do you navigate to in order to check that the ELK server is running?

_As a **Bonus**, provide the specific commands the user will need to run to download the playbook, update the files, etc._
