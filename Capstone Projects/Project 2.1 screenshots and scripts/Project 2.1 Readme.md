Hello, again.

This is an illustration of how to create a ASG,cloudwatch, IAM role and scaling policies in pure Terraform.

The directory contains the basic code to:

Create a VPC with public subnets. 
Create private subnets, matching the public subnets' availability zones, 
with NAT for outbound access. ALB connected to the public subnets. 
An ASG connected to the ALB. 
The instances in the launch configuration will find the latest hvm-ebs Amazon Linux instance, 
and then will bootstrap the instance with a test webpage based on pure user data.
The config prints the ALB hostname as outputs.

***Please note***
Some of the codes used in this illustration are from the previous task.

The screenshots show the deployed resources active using terraform.
However, the scripts and codes used in configuring the resources are in the folder.

Thank you.