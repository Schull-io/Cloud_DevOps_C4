
# Ansible Capstone project

## 1. Set up up an Ansible inventory
Edit /etc/ansible/hosts with Vim or whatever editor is handy and comfortable. We&#39;ll use
Vim here:
[root@server1 ]# vi /etc/ansible/hosts
Your inventory file should look something like this when you&#39;re done:
[dbservers]
dbserver1
[webservers]
webserver1
[admins]
adminserver1

## 2. Set up SSH Keys
The first step in setting SSH key up is generating a key:
[root@server1 ]# ssh-keygen
Then you can copy it over to webserver1 with the command:
[root@server1 ]# ssh-copy-id username@youserver
Repeat this with the other two servers, using the cloud_user password for the ansible user:
[root@server1 ]# ssh-copy-id username@youserver
[root@server1 ]# ssh-copy-id username@youserver
Test by logging into one of the servers:
[root@server1 ]# ssh username@youserver

## 3. Set up Sudeors
Log into webserver1 as cloud_user:
[root@server1 ]# username@youserver
Now gain root privileges:
[cloud_user@webserver1 ]$ sudo -i

Run visudo and add the following line to the end of the file:
ansible ALL=(ALL) NOPASSWD: ALL
Run logout to get out of this server, so that we&#39;re back in server1, and then repeat the
process for dbserver1 and adminserver1.
Once that&#39;s done, test (from server1 with:
[root@server1 ]# ssh username@youserver
Once you&#39;re in, try a sudo command:

## 4. Write a Playbook to Install httpd, but Only on Web Servers

## 5 .Use an Ad Hoc Command to Install tcpdump 

## 6. Create Multiple Users on All Servers

Take a screenshot of every stage (your commands/playbooks) and the result of running the
command and keep it in a result directory

