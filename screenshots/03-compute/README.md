# Compute. EC2 and Jump Server

Amazon EC2 provided the compute layer for the web application.

The project used a Jump Server and application servers to separate administrative access from the application environment.

## Jump Server

The Jump Server was created as an administrative entry point into the infrastructure.

Its purpose was to provide controlled access to resources that were not directly exposed to the public internet.

The Jump Server was configured separately from the application servers and was used as part of the project's secure network design.

## Web Servers

EC2 instances were used to host the web application.

Nginx was installed on the web servers and configured to serve the website from the shared EFS filesystem.

The application servers were later placed behind the Application Load Balancer and managed through the Auto Scaling Group.

## Screenshots

The screenshots in this section document the EC2 resources created during the project.

## Outcome

The EC2 layer provided the compute resources required to run the web application while separating administrative access from application workloads.

This created the foundation for the Auto Scaling and load-balancing stages of the project.

