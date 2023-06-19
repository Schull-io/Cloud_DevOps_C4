# Working with RDS in AWS
## Tasks:

Create an Amazon VPC for use with a DB instance Create a VPC with private and public subnets and multiple subnets Create a VPC security group for a public web server Create a VPC security group for a private DB instance Create a DB subnet group Performn Clean up actions

NB: If you fail to perform clean up actions, costs are usually incurred.

Guide:

https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/TUT_WebAppWithRDS.html

https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/CHAP_Tutorials.html









## LAB Experience

## Create an Amazon VPC for use with a DB instance Create a VPC with private and public subnets and multiple subnets
Open the Amazon VPC console,In the top-right corner of the AWS Management Console, choose the Region to create your VPC in.

In the upper-left corner, choose VPC dashboard. To begin creating a VPC, choose Create VPC.

For Resources to create under VPC settings, choose VPC and more.

For the VPC settings, set these values:

Name tag auto-generation – tutorial

IPv4 CIDR block – 10.0.0.0/16

IPv6 CIDR block – No IPv6 CIDR block

Tenancy – Default

Number of Availability Zones (AZs) – 2

Customize AZs – Keep the default values.

Number of public subnet – 2

Number of private subnets – 2

Customize subnets CIDR blocks – Keep the default values.

NAT gateways ($) – None

VPC endpoints – None

DNS options – Keep the default values.

## Create a VPC security group for a public web server

Open the Amazon VPC on the console,Choose VPC Dashboard, choose Security Groups, and then choose Create security group.

On the Create security group page, set these values:

Security group name: cst-demo securitygroup

Description: cst Tutorial Security Group

VPC: Choose the VPC that you created earlier, 

Add inbound rules to the security group.

In the Inbound rules section, choose Add rule.

Set the following values for your new inbound rule to allow SSH access to your Amazon EC2 instance. If you do this, you can connect to your Amazon EC2 instance to install the web server and other utilities. You also connect to your EC2 instance to upload content for your web server.

Type: SSH

Source: The IP address or range from Step a, for example: 203.0.113.25/32.

Choose Add rule.

Set the following values for your new inbound rule to allow HTTP access to your web server:

Type: HTTP

Source: 0.0.0.0/0

Choose Create security group to create the security group.


## Create a DB subnet group

Identify the private subnets for your database in the VPC.

Open the Amazon VPC console on the console

Choose VPC Dashboard, and then choose Subnets.

Note the subnet IDs of the subnets named tutorial-subnet-private1-us-west-2a and tutorial-subnet-private2-us-west-2b.

You need the subnet IDs when you create your DB subnet group.

Open the Amazon RDS on the console

Make sure that you connect to the Amazon RDS console, not to the Amazon VPC console.

In the navigation pane, choose Subnet groups.

Choose Create DB subnet group.

On the Create DB subnet group page, set these values in Subnet group details:

Name: tutorial-db-subnet-group

Description: Tutorial DB Subnet Group

VPC: cst tutorial vpc

In the Add subnets section, choose the Availability Zones and Subnets.

For this tutorial, choose us-west-2a and us-west-2b for the Availability Zones. For Subnets, choose the private subnets you identified in the previous step.

Choose Create.

Your new DB subnet group appears in the DB subnet groups list on the RDS console. You can choose the DB subnet group to see details in the details pane at the bottom of the window. These details include all of the subnets associated with the group.
