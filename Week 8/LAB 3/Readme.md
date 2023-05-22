# Working with EFS


## Task

Create your Amazon EC2 resources and launch two EC2 instance.
Create your Amazon EFS file system with One Zone storage.
Connect to each of your Amazon EC2 instances, and mount the Amazon EFS file system using the same mount target for each instance.
Guide: https://docs.aws.amazon.com/efs/latest/ug/gs-step-two-create-efs-resources.html






## LAB Experience

## Create your Amazon EC2 resources and launch two EC2 Instance

Enter a Name for your file system.

For Virtual Private Cloud (VPC), choose your VPC, or keep it set to your default VPC.

Choose Create to create a file system that uses the following service recommended settings: Automatic backups enabled. 

Mount targets configured with the following settings:

  (i)Created in each Availability Zone in the AWS Region in which the file system is created.

  (ii)Located in the default subnets of the VPC you selected.

Using the VPC's default or your created VPC security group – You can manage security groups after the file system is the created.

After you create the file system, you can customize the file system's settings with the exception of availability and durability, encryption, and performance mode.

The File systems page appears with a banner across the top showing the status of the file system you created. 


## Create your Amazon EFS file system with One Zone storage.

Amazon EFS offers a range of storage classes that are designed for different use cases. These include EFS Standard, EFS Standard–Infrequent Access (Standard-IA), EFS One Zone, and EFS One Zone–Infrequent Access (EFS One Zone-IA). The following sections provide details of these storage classes.


