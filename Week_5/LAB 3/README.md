# Lab 3: Manage Packages and Services on a Linux VM (Azure or AWS)


1. Create a Linux VM
2. Install the Apache Web Server
3. Start the service status via command line
4. Investigate the service status via command line
5. Stop the service


Challenge: Create a boostrapping script that will install and start this service on new EC2 VMs

Notes:

Install and Configure Apache (Ubuntu)

https://ubuntu.com/tutorials/install-and-configure-apache#1-overview
How to install Apache on RHEL 8 / CentOS 8 Linux

https://linuxconfig.org/installing-apache-on-linux-redhat-8
How to use cloud-init to customize a Linux virtual machine in Azure on first boot

https://docs.microsoft.com/en-us/azure/virtual-machines/linux/tutorial-automate-vm-deployment
Create bootstrap actions to install additional software

https://docs.aws.amazon.com/emr/latest/ManagementGuide/emr-plan-bootstrap.html















## LAB Experience



## 1.Create a Linux VM

I  created a linux Virtual machine using AWS platform. I created the Instance using CLI, configured the images and region and I ssh into the running instance.

## 2.Install the Apache Web Server

A web server can be installed on a running instance. I was able to install a web server (apache) into my running virtual machine through my terminal, I ran the following command

_Sudo yum update -y \
Sudo yum install -y httpd \
( this is the command to install apache web server).

## 3. Start the service status via command line

After installing any server on instances or even installing applications on our local system we need to start the application for it to function. Same goes for the web server installed on our ec2 instances we need to start the web server for it to run so i ran the following command given that apache is already installed successfully on the instance.

_sudo systemctl start httpd_

(If this is successful it means we have started the installed web server on our instance) of which after i did run the command, it was successful

## 4. Investigate the service status via command line

After I’ve successfully installed and started our web server, I need to check it's status to confirm whether or not it is running. We can do this by actually viewing the server using our IP address.

**NOTE**

That port 80 will have to be opened in order to be able to view the server in action using our IP address.
Likewise, on the terminal, the status of the installed web server can be viewed and investigated by running the command below;

_sudo service httpd status_

(this is to check whether or not the web server which is apache is running)

## 5. Stop the service.

The following command is to disable or stop the apache service from running

_sudo systemctl disable httpd_ 

(this is to disable apache from running on our instance)

_sudo systemctl stop httpd _  

(this is to stop apache from running on our instance).



![Screenshot on Lab3(windows power shell)](https://user-images.githubusercontent.com/105374941/186179856-90745518-4cf0-48f2-9032-d0ebc8900a53.png)



![screenshot on Lab3](https://user-images.githubusercontent.com/105374941/186180102-83eaf8bc-da8c-4997-882d-b003f0d8fcfd.png)


