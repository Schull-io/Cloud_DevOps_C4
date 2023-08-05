# Lab 4: Create and use an SSH public-private key pair for Linux VMs in Azure

Task:
1. Supported SSH key formats
2. Create an SSH key pair
3. Provide an SSH public key when deploying a VM
4. SSH into your VM


Notes:
Quickstart: SSH for Linux VMs

https://docs.microsoft.com/en-us/azure/virtual-machines/linux/mac-create-ssh-keys
Quickstart for Bash in Azure Cloud Shell

https://docs.microsoft.com/en-us/azure/cloud-shell/quickstart














## My Lab 4 Experience 


## 1. Supported SSH key formats

There are ssh key format that azure support. and the exact format supported by azure is SSH protocol 2 (SSH-2) RSA public-private key pairs with a minimum length of 2048 bits.

## 2. Create an SSH key pair

I created the ssh key pair using the ssh-keygen command. for example

ssh-keygen -m PEM -t rsa -b 4096

A breakdown of the commands and sub commands is given below

ssh-keygen = the program used to create the keys

-m PEM = format the key as PEM

-t rsa = type of key to create, in this case in the RSA format

-b 4096 = the number of bits in the key, in this case 4096

## 3. Provide an SSH public key when deploying a VM

I provided the ssh pulic key while deploying into the VM. an example of what i did is this

az vm create
--resource-group myResourceGroup1
--name myVM1
--image UbuntuLTS
--admin-username azureuser
--ssh-key-value ~/.ssh/id_rsa.pub

## 4. SSH into your VM

I ssh into the VM and was connected. ruuning this command

ssh azureuser@public_ip_address

I replaced the azureuser with the admin username that was created while deploying the VM, and replace Public_ip_address with the public adress value that was assigned upon creating the VM.


## Short Notes on SSH

SSH is an encrypted connection protocol that provides secure sign-ins over unsecured connections. SSH is the default connection protocol for Linux VMs hosted in Azure. We recommend connecting to a VM over SSH using a public-private key pair, also known as SSH keys.

The public key is placed on your Linux VM.

The private key remains on your local system. Protect this private key. Do not share it.

When you use an SSH client to connect to your Linux VM (which has the public key), the remote VM tests the client to make sure it has the correct private key. If the client has the private key, it's granted access to the VM. Depending on your organization's security policies, you can reuse a single public-private key pair to access multiple Azure VMs and services. You do not need a separate pair of keys for each VM or service you wish to access.
