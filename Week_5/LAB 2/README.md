# Lab 2: Manage Linux VMs with the AWS CLI


1. Create virtual machine
2. Connect to VM
3. Understand VM images
4. Understand VM sizes
5. VM power states
6. Management tasks



Notes:
Quickstart: Create a Linux VM

https://aws.amazon.com/getting-started/launch-a-virtual-machine-B-0/
Using a custom Amazon machine image (AMI)

https://docs.aws.amazon.com/elasticbeanstalk/latest/dg/using-features.customenv.html
Quickstart: Restart VM via CLI

https://docs.aws.amazon.com/cli/latest/reference/ec2/reboot-instances.html
Quickstart for AWS CloudShell

https://docs.aws.amazon.com/cloudshell/latest/userguide/working-with-cloudshell.html











##  My LAB 2 Experience




## 1. Create virtual machine.

The Aws virtual machine can be created basically using two procedures

The GUI and;

The command line.

I used both for the creation of my VMs. I used the CLI (Cloud shell) to create a VM by using various commands.I ran this command to create my second VM

--image-id ami-0abcdef1234567890 \

--instance-type t2.micro \

--key-name myfirstkey

I had created a key pair (Test-004) which I then used to create my VM



## 2. Connect to virtual machine


I ssh into my Virtual machine using the ssh client (Windows Terminal). I copied the key on the interface and opened it on my windows terminal where the key is located and i was able to connect to my VM with this command "ssh -i "Test-004.pem" ec2-user@ec2-44-204-2-2.compute-1.amazonaws.com"


## 3. Understand VM images


VM images stands as configuration for the instance created. One has to choose an image or configuration before setting up a virtual machine depending on its use. One can also choose from template images or create one from the scratch. The VM Images are in hundreds, there are lots of configurations to pick from depending on the work we want to carry out. 

we can as well create images by running this command 

_aws ec2 create-image \ --instance-id i-1234567890abcdef0 \ --name "My server"_


## 4. Understand VM Sizes

The virtual machine size(s) determines the amount of compute resource and the memory avaliable to our instance. We have varieties of sizes to pick from either from the creation of the instance or we can as well add to it even after the machine is running. One need to pick the size or sizes that would be enough for the workload to be done. If the instance is created to run a number of activites then we will definately need to pick a large size for the instance and. One can also create the particular size needed for the job.

we can create varieties of VM Size by running the command below

_aws ec2 create-volume \ --volume-type gp2 \ --size 80 \ --availability-zone us-east-1a_

To create a VM Size with Tags you can as well run this command

aws ec2 create-volume \ --availability-zone us-east-1a \ --volume-type gp2 \ --size 80 \ --tag-specifications 'ResourceType=volume,Tags=[{Key=purpose,Value=production},{Key=cost-center,Value=cc123}]'

And many more depending on the Job specifications

## 5. VM power states

The VM power state shows the current state of any virtual machine. it shows Maybe it is running or not, maybe it's stopped or starting or maybe it has been terminated. we can view the power state of any instance by running some command on the cloud shell.

aws ec2 stop-instances --instance-ids (instance id) - This is to stop the instance

aws ec2 start-instances --instance-ids (instance id) - This is to start the instance

aws ec2 terminate-instances --instance-ids (instance id) - This is to terminate the instance.

## 6. Management tasks

We will have to manage our instance for various reasons, One being to help us lower cost or help from incuring some avoidable charges. For example when an instance is not in use we can stop for the main time instead of making it run which incur lots of charges for something not in use. We will want to run the management tasks such as deleting, starting, stopping, a VM. Using various command for various task.






## Here are Some Screenshot

![lb2 aws-](https://user-images.githubusercontent.com/105374941/186178638-6aa26659-f84c-4095-9fe2-ed14b9bc467a.png)


![lb2 aws img](https://user-images.githubusercontent.com/105374941/186178680-1dc30f89-02fd-48a9-ad2a-7bf94454018f.png)

