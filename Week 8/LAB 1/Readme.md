# Working with EBS
## Tasks:

Create an Amazon EBS volume
Attach and mount your volume to an EC2 instance
Create a snapshot of your volume
Create a new volume from your snapshot
Attach and mount the new volume to your EC2 instance
Guide:

https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ebs-volumes.html

https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ebs-attaching-volume.html






## LAB 1 Experience

## Short Note on EBS
An Amazon EBS volume iis a durable, block-level storage device that you can attach to your instances. After you attach a volume to an instance you can use it as you would use a physical hard drive. EBS volumues are flexible.

## Create an EBS Volume
Here are the steps to creating an EBS Volume using the console, they are as follows;
Open the Amazon EC2 console, in the navigation pane, choose volumes, then create volume... 
For volume type and size choose the type and size you want to create, then enter the maximum number of input/output operations per second(IOPS) that the volume should provide.. Choose your availability zone  in which to create the volume.
Note: A volume can be attached only to an instance that is in the same availability zone.

## Attach and mount your volume to an EC2 instansce
EBS volume can be attach to one or more of your instances that is in the same availability zones as the volume and to achieve that here are the steps below.
Open Amazon EC2 console , then in navigation pane, choose volumes, then select the volume to attach and choose ACTION, ATTACH VOLUME.
Note: You can only attach only volumes that are in available state.
      If the volume is encrypted, it can only be attached to instance types that support Amazon EBS           encryption
  
## Create a snapshot of your volume
In the navigation pane after opening EC2 using the console, Choose snapshots, then create snapshot... 
For resource type, choose volume.
For Volume ID, select the volume from which to create the snapshot
then choose create snapshot 

## Create a new volume from your snapshot
on the console go to storage > snapshots, click volumes, then create, click the the snapshot you want to create a volume from  after selecting the snapshot click create volume. In the Name field, type the name for the volume, In the Size field, type a size in gibibytes, In the Type list, select a volume type.. In the IOPS field, type the numbr of IOPS for the volume.. In the Availability zone List, select the availability zone in which you want to create the volume.. In the count field, type the number of volumes you want to create...
Then click create, a volume is then created from the selcted snapshot and now appearson the volume page

## Attach and mount the new volume to your EC2 instance
