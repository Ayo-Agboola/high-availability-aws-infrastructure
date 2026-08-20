# High Availability AWS Infrastructure Project

## Project Overview

This project demonstrates the design and deployment of a highly available and scalable web application infrastructure on Amazon Web Services (AWS).

The project was built to demonstrate how cloud infrastructure can be designed to support reliable application delivery across multiple Availability Zones while providing scalability, traffic distribution, secure communication, monitoring and automated alerting.

The project also provides a practical foundation for understanding how scalable cloud infrastructure can support data-driven applications and data pipelines that require reliable computing resources, network connectivity, monitoring and availability.

## Project Objectives

The main objectives of this project were to:

* Design a highly available AWS network infrastructure.
* Deploy application servers across multiple Availability Zones.
* Use an Auto Scaling Group to manage application instances.
* Distribute incoming traffic using an Application Load Balancer.
* Provide shared storage using Amazon EFS.
* Configure secure communication using HTTPS and AWS Certificate Manager.
* Connect a custom domain to the application using Amazon Route 53.
* Monitor infrastructure performance using Datadog.
* Configure Slack notifications for infrastructure alerts.
* Test the availability and health of the deployed application.
* Document the complete infrastructure deployment process.

## Architecture

The infrastructure was progressively built from the network layer through the application, security, monitoring and alerting layers.

The major flow of the project was:

**VPC → Availability Zones → Subnets → Route Tables → NAT Gateway → Security Groups → Jump Server → EFS → Launch Template → Auto Scaling Group → EC2 → Target Group → Application Load Balancer → Route 53 → ACM → HTTPS → Datadog → Slack**

The architecture was designed so that application instances operate within private subnets while the Application Load Balancer provides public access to the application.

## AWS Services and Tools Used

### AWS Services

* Amazon VPC
* Amazon EC2
* Amazon EFS
* Internet Gateway
* NAT Gateway
* Route Tables
* Security Groups
* Application Load Balancer
* Target Groups
* Auto Scaling
* Amazon Route 53
* AWS Certificate Manager (ACM)

### Monitoring and Alerting

* Datadog
* Slack

### Other Tools

* GitHub
* Linux
* SSH
* Bash
* Nginx
* Namecheap

## High Availability Design

The infrastructure uses two Availability Zones within the `us-east-1` AWS Region.

The network contains:

* Two public subnets.
* Two private subnets.
* An Internet Gateway for internet connectivity.
* A NAT Gateway for outbound internet access from private resources.
* Separate routing for public and private resources.

The application instances are deployed in the private subnets, while the Application Load Balancer operates in the public subnets.

This design separates publicly accessible infrastructure from the application servers and provides redundancy across Availability Zones.

## Monitoring and Alerting

Datadog was integrated into the infrastructure to monitor the EC2 instances and collect system-level metrics such as CPU and memory utilisation.

Slack was connected to Datadog so that infrastructure alerts could be delivered to a dedicated Slack channel.

A CPU utilisation monitor was configured and tested to verify that Datadog could detect the defined condition and send an alert to Slack.

## HTTPS and Domain Configuration

The application was connected to the custom domain:

**ayoagboola.online**

Amazon Route 53 was used to manage the DNS records and route traffic to the Application Load Balancer.

AWS Certificate Manager was used to obtain an SSL/TLS certificate for the domain.

An HTTPS listener was configured on port 443, and HTTP traffic was subsequently configured to redirect to HTTPS.

The final application was therefore accessible securely through HTTPS.

## Challenges Encountered

Several challenges were encountered during the deployment and configuration of the infrastructure.

These included:

* EC2 instances becoming unhealthy during the initial load balancer configuration.
* Understanding the relationship between the Auto Scaling Group, Launch Template and Target Group.
* Configuring Datadog monitoring across multiple EC2 instances.
* Configuring Datadog notifications correctly for Slack.
* Understanding how Route 53 hosted zones and Namecheap name servers work together.
* Resolving DNS configuration issues that initially produced an `NXDOMAIN` error.
* Configuring the ACM certificate and completing DNS validation.
* Configuring the HTTPS listener on the Application Load Balancer.
* Redirecting HTTP traffic to HTTPS.
* Understanding how multiple EC2 instances are created and managed by the Auto Scaling Group.

These challenges provided practical experience in troubleshooting cloud infrastructure rather than simply following a deployment guide.

## Project Validation

The infrastructure was tested at different stages of deployment.

Validation included:

* EC2 instance health checks.
* Target Group health checks.
* Application Load Balancer connectivity.
* Domain resolution through Route 53.
* HTTPS certificate validation.
* HTTP-to-HTTPS redirection.
* Datadog metric collection.
* Slack notification testing.
* Website accessibility through the custom domain.

## Project Documentation

The repository contains the detailed documentation of how the infrastructure was built.

Each stage includes the configuration performed, the reason for the configuration, validation steps and relevant screenshots.

Screenshots are included where they provide useful evidence of the actual AWS configuration and testing performed during the project.

## Project Status

**Completed**

The infrastructure was successfully deployed and the application was made accessible through the custom domain using HTTPS.

Monitoring and Slack alerting were also configured and tested.

## What I Learned

This project provided practical experience in designing and deploying cloud infrastructure rather than learning individual AWS services in isolation.

It strengthened my understanding of how networking, compute, storage, load balancing, DNS, security, monitoring and alerting work together as one infrastructure.

It also helped me understand an important connection between cloud computing and data analytics. Data applications depend on infrastructure that can reliably collect, process, store and monitor workloads as the volume of data and users increases.

## Author

**Ayomide Emmanuel Agboola**

Data Analytics | Cloud Computing | Procurement & Business Analytics
