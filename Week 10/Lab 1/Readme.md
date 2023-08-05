# Working with Elastic Load balancing
## Tasks: 

Using AWS CLI,

Create an Application Load Balancer
Create a Network Load Balancer
Create a Gateway Load Balancer
Create a Classic Load Balancer
Perform clean up operations
NB: You need to launch at least two instances to do this.

Guide https://docs.aws.amazon.com/elasticloadbalancing/latest/userguide/load-balancer-getting-started.html






## LAB Experience

## Elastic Load Balancer
It is used to manage load balancing between multiple EC2 instance across in multiple availability zones on AWS. it distributes load across specified targets more so,it enables us to have increased availabity of application in multiple availability zones.

## Create an Application Load Balancer
Here is the command that helps you create an internet-facing Application Load Balancer and enables the availability zones for the the specified subnet...

    aws elbv2 create-load-balancer \--name DanALB \--subnets subnet-b7d581c0 subnet-8360a9e7

