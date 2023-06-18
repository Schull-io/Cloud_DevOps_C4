# Ansible Projects

## Using Modules in Ad Hoc Commands
Use ansible all -m ping to verify that all hosts in inventory are in a manageable state.
Type ansible ansible1 -m yum -a "name=httpd state=installed" to install the httpd software package on host ansible1.
Verify that the package is installed using ansible all -m command -a "rpm -qa | grep httpd". Analyzing the output, you can see that the rpm -qa command runs successfully on the managed hosts, but the pipe is ignored.
Use ansible all -m shell -a "rpm -qa | grep httpd". In the output you
can see that node ansible2 gives a “non-zero return code” message, meaning that the command did not complete successfully. You can also see a list of matching packages on ansible1. Last, you can see a warning message stating that you should use the yum module instead. Notice that the shell as well as the command modules reported a changed status as the result, even if nothing has really changed.
Use ansible all -m yum -a "list=httpd" and compare the output to the output of the command used in step 4.
Use ansible all -m command -a "systemctl status httpd" to verify the current status of the httpd service. It should show the service is not found on ansible2 and the service is inactive and disabled on ansible1.
Use ansible ansible1 -m service -a "name=httpd enabled=yes state=started" to start and enable the httpd service on ansible1.
Run the command ansible all -m command -a "systemctl status httpd" again to verify the modification has been applied.

## Running Your First Playbook

Type vim exercise.yaml to open a new file that will contain the desired playbook code. Make sure the file is created in your home directory, where an ansible.cfg and inventory file already exist.
Type three dashes to start the playbook code: 
--- Start the play definition on a new line. 
This play definition starts with a dash, which is followed by a space and name:, which is followed by the name of the play:
---
- name: install and start the vsftpd service
You need to add a line that defines the hosts that the play should manage. Notice that this line is indented at the same level as the word “name” because this line is a part of the same play definition:
---
- name: install and start the vsftpd service hosts: all
In the next part of the play, you define the tasks that will be executed by this play. Under the word hosts, indented at the same level, type tasks:. There is nothing after the colon because the value of the key tasks is a list of tasks, which is provided on the next couple of lines:
---
- name: install and start the vsftpd service

## hosts: all tasks:

At this point, you can start defining the tasks. The first task ensures that the yum module is used to define the vsftpd package. Notice the indentation, which identifies that the task is a child element of the play:
---
- name: install and start the vsftpd service hosts: all
tasks:
- name: install vsftpd
yum:
At this point, you may specify the arguments to the yum module. Because these arguments are child elements in relation to the yum module, you need another level of indentation:
---
- name: install and start the vsftpd service hosts: all
tasks:
- name: install vsftpd
yum:
name: vsftpd state: latest

The first task is now defined, and you can specify the next task that calls the service module to start and enable the vsftpd service. Notice that this task is indented at the same level as the yum task:
---
- name: install and start the vsftpd service hosts: all
tasks:
- name: install vsftpd
yum:
name: vsftpd state: latest
- name: start and enable vsftpd service service:
name: vsftpd state: started enabled: yes
The playbook is now completed, so write your changes to the file and quit the editor. Next, use ansible-playbook exercise.yaml to run the playbook.
Observe the output of the playbook and verify that everything has executed all right.


Take screenshots of your output and add at as your assignment result
