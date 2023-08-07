# Deploy Apache Web Server using Terraform IaC

## Objective
THe objective of this project to write Terraform IaC to deploy Apache Webserver in AWS cloud.

## Requisite
Create below resources using  Terraform IaC
Create S3 Bucket to store the terraform statefiles
Create DynamoDB
Deploy VPC Network using Terrafom IaC and keep the state file in S3 backend.
Create below resources using Terraform IaC and keep the state file in S3 backend
S3 Bucket to store the webserver configuration and PUT index.html and Ansible Playbook
SNS topic for notifications
IAM Role
Golden AMI
Keep the Ansible Playbook to configure Apache webserver


## Deployment
Write Terraform IaC to deploy below resources in the VPC that was created in the Pre-Requisites step and keep the state file in S3 backend with state locking support.
Create  IAM Role granting PUT/GET  access to S3 Bucket and Session Manager access.
Create Launch Configuration with userdata script to pull the index.html file from S3 and attach IAM role and configure the webserver (May run Ansible Playbook to configure webserver)
Create Auto Scaling Group with Min:1 Max: 1 Des: 1  in private subnet
Create Target Group with health checks to and attach with Auto Scaling Group
Create Application Load balancer in public subnet and configure Listener Port to route the traffic to the Target Group
Create alias record in Hosted Zone to route the traffic to the Load balancer from public network.
Create Cloudwatch Alarms to send notification when ASG state changes.
Create Scaling Policies to scale out/Scale In when average CPU utilization is > 80%
Deploy Terraform IaC to create the resources


## Validation

Login to AWS Console and verify all the resources are deployed
Access the web application from public internet browser using the domain name.

## Perform Clean up operation


### Guide
https://dev.to/chefgs/create-apache-web-server-in-aws-using-terraform-1fpj





AKIAWU5R4P3LMXQNCD3C: access key
rfDEJEuwgP9HqTcmOg6otos0d6JrF/YHARDsvuka:secrete accsess key




//Create Dynamodb
resource "aws_dynamodb_table" "statelock" {
  name = "state-lock"
  billing_mode = "PAY_PER_REQUEST"
  hash_key = "LockID"
  

   attribute {
    name = "LockID"
    type = "S"
  }
}
Danniecrypt4
London
AKIA6QACS24SOJYTAAOG: access key
GGphs5UZJUGfyimnDk/4psI01uXglQVvIOFjAt46:secrete accsess key

Danniecrypt5

AKIA6QACS24SL7NMU6BC: access key
K+ZLYwvLTC/NsbS4jm2pIQN+D8skvBZBa1WT+r43:secrete accsess key












# Consolidation of all groups
#[hosts:children]
#web-servers
#offsite
#onsite
#backup-servers

#[web-servers]
#server1 ansible_host=192.168.0.1 ansible_port=1600
#server2 ansible_host=192.168.0.2 ansible_port=1800

#[offsite]
#server3 ansible_host=10.160.40.1 ansible_port=22 ansible_user=root
#server4 ansible_host=10.160.40.2 ansible_port=4300 ansible_user=root

# You can make groups of groups
#[offsite:children]
#backup-servers

#[onsite]
#server5 ansible_host=10.150.70.1 ansible_ssh_pass=password

#[backup-servers]
#server6 ansible_host=10.160.40.3 ansible_port=77

[Danniehosts]
192.168.0.132 ansible_ssh_user=root ansible_ssh_passwd=Dannie456#@$%






