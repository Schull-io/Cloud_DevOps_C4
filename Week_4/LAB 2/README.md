# Lab 2: Manage Linux VMs with the Azure CLI

Task: 

1. Create resource group
2. Create virtual machine
3. Connect to VM
4. Understand VM images
5. Understand VM sizes
6. VM power states
7. Management tasks


Notes:
Quickstart: Create a Linux VM

https://docs.microsoft.com/en-us/azure/virtual-machines/linux/tutorial-manage-vm
Quickstart for Bash in Azure Cloud Shell

https://docs.microsoft.com/en-us/azure/cloud-shell/quickstart














## My LAB EPERIENCE

## 1. Create resoucre group
I am now acquitted to creating resource groups using both GUi and CLi, I created different resource group using CLi.

## 2. Create Virtual machine
I created a virtual machine and named it myfirstVM

## 3. Connect to VM

i was able to connect after i read through an article on how to create a key pair using the ssh-keygen command. after this i was able to ssh into the vm using the ssh command

ssh azureuser@public_ip_address

## 4. Understand VM images

The VM images is the configuration of what i want my VM to carry, it includes the ram, the c.p.u, the disk etc. The VM Images are in hundreds, there are lots of configurations to pick from depending on the work we want to carry out. We have Images from different publisher like SUSE,Redhat,windows, coreos. The images are much so we can pick from any of them depending on the task. to see a list if VM images available, run the command

_az vm image list --output table_

## 5. Understand VM sizes

The VM sizes determines the amount of compute resource, the memory avaliable to the VM. When we talk about VM size, we talk about how much resources the VM will consume. One needs to pick the size that would be enough for the workload to be done. If the task ahead requires much space to work with then it is advisable to pick a large size. One can also create the particular size needed for the job and also go ahead to partition it running some commands. To view a list of VM sizes in a particular region, run the command

_az vm list-sizes --location eastus --output table_

## 6. VM power State

The VM power state shows the current state of the virtual machine. Maybe or not it is running,stopped, starting, deallocating. we can view the power state by running some command on the cloud shell starting with (az vm grt-instance-view) then add other subcommands. 
Example;

_az vm get-instance-view --name myVM --resource-group myResourceGroupVM --query instanceView.statuses[1] --output table_

## 7. Management task

One will want to manage the VM and will want to run the management tasks such as deleting, starting, stopping, a VM. Using various command for various task. examples are

_az vm delete(to delete a VM)_

_az vm deallocate (to deallocate the vm)_

_az vm start (to start up a vm that was stopped)_

_az group delete (to delete a resource group)_




![lb2 az 01](https://user-images.githubusercontent.com/105374941/186142347-052d1b94-b702-4a3c-ad35-ec89eeafd6ea.png)



![lb2 az 02](https://user-images.githubusercontent.com/105374941/186142392-be3055bf-6cba-4f65-be55-85f776740110.png)



![lb2 az 03](https://user-images.githubusercontent.com/105374941/186142427-d611ec38-b97d-49f1-a9ce-4dd16cb68d6f.png)




![lb az 04](https://user-images.githubusercontent.com/105374941/186142509-ce62be89-570f-4951-8708-f5a7d5176634.png)




![lb2 az 05](https://user-images.githubusercontent.com/105374941/186142566-f0303a54-20d3-4820-bfbc-b77c77ebc72c.png)




![lb az 06](https://user-images.githubusercontent.com/105374941/186142609-1f1de8e3-368b-43de-9288-08f80ded78c1.png)



![lb az 07](https://user-images.githubusercontent.com/105374941/186142666-c21b9e84-f315-4aeb-8aff-68b3410dc675.png)



![lb az 08](https://user-images.githubusercontent.com/105374941/186142914-d541f9f2-ca42-43d6-890d-45ce129a28fe.png)




![lb az 09](https://user-images.githubusercontent.com/105374941/186142969-5e7f7b3b-25f6-40f1-9468-670ec3abbf51.png)



![lb2 az 10](https://user-images.githubusercontent.com/105374941/186143004-50351191-9bf1-4832-86ce-a4540c61eb7d.png)





