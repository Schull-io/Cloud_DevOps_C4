## Install a LAMP web server on Amazon Linux

Tasks:

1. Prepare the LAMP server
2. Test your LAMP server
3. Secure the database server
4. Install phpMyAdmin


Guide: https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/install-LAMP.html

Grading tip:  Screenshot major script outputs and upload with your step by step answer















## My Lab Experience


## Short Notes

LAMP is an open source web development platform that uses Linux as the operating system(OS), Apache as the Web server, My SQL as the relational database management system and PHP as the object-oriented scripting language.. (sometimes python is used instead of PHP)

it is often referred to as stack because the platform has four layers 

## 1. Prepare the LAMP server

I created an ec2 instance using the GUI and CLI and i ensured it configured my security group to allow SSH(port 22), HTTP(port 80) connnections ..
Then i ssh it into the gitbash CLI to connect my instance with the command 

    $ ssh -i "lamp.pem" ec2-user@ec2-3-133-156-184.us-east-2.compute.amazonaws.com

Afterwards,To prepare THE LAMP server i ran various code below;

**To ensure that all software packages are up to date on my instance with the command below**

      sudo yum update -y

**To install the latest version of the LAMP MariaDB and PHP packages** 

sudo amazon-linux-extras install -y lamp-mariadb10.2-php7.2 php7.2

**To install the Apache web server, MariaDB, AND PHP software packages i used the yum install command below**

    sudo yum install -y httpd mariadb-server

**To start and enable the Apache web server**

    sudo systemctl start httpd

    sudo systemctl enable httpd

i equally ran this command to check whether the web server is enabled already   

     sudo systemctl is-enabled httpd

Furthermore, i ensured that the security rule allows inbound HTTP(port 80) connections which would have been done during the stage of launching the ec2 instance only checked to verify to see if the 
port range -- 22
protocol -- tcp 
source -- 0.0.0.0/0 (Using this source allows all IPv4 addresses to access your instance using SSH. This is acceptable for a short time in a test environment which are trying to achieve, but unsafe in a production environment.)

Tested the apache web server in my web browser, by using the public IP address of my instance and it worked.
Meanwhile, Apache httpd serves files that are kept in a directory called Apache document root and the Amazon Linux Apache document root is  _/var/www/html_ which is owned by root 
To allow the ec2-user account to manipulate files in this directory, i achieved this by modifying the ownership and permissio of the directory by running various commands below

     sudo usermod -a -G apache ec2-user

    (To add user(i.e.my ec2-user) to the apache group)

 Log out with the exit command and log back in again to pick up the new group with the group command 

To as well change the group owernership of var/www and its contents to the apache group with the command below 

      sudo chown -R ec2-user:apache /var/www

To add the group write permission and set the group ID on future subdirectories and recursively change the file permission with the command below 
   
     sudo chmod 2775 /var/www && find /var/www -type d -exec sudo chmod 2775 {} \;

     find /var/www -type f -exec sudo chmod 0664 {} \;


## 2. Test your LAMP server

When my server is installed and running, and the file permissions are set correctly the ec2-user should be able to create a PHP file in the /var/www/html directory available on the internet. To check this we ran the following command below to test my LAMP server 


    echo "<?php phpinfo(); ?>" > /var/www/html/phpinfo.php
        
        (To create a PHP in the Apache document root )

Afterwards, i added my public IP Address slash the file name 
as seen below

     http://3.133.156.184//phpinfo.php

Lastly, i deleted the phpinfo.php file by the command below because it should not be broadcast to the internet for security reasons 

          _rm /var/www/html/phpinfo.php_
          
     **Below is the outcome after adding my public IP Address slash the file name**
     
  
  ![Testpage php](https://user-images.githubusercontent.com/105374941/186642547-2039755c-c162-4711-900a-8f3967e73cc6.png)



## 3. Secure the database server

Achieved this by using the various commands below

**To start the MariaDB server , incase it was stopped after initial installation
  
         sudo systemctl start mariadb

**Run mysql secure installation
  
      _sudo mysql_secure_installation_

Afer i ran the command i received a prompt to type a password fo the root account -- procedures i followed to achieve that

    i. To type the current root password i pressed Enter
    ii. Type Y to set a password 
    iii. Type Y to remove the anonymous user accounts
    iv. Type Y to disable the remote root login
    v.  Type Y to remove the test database 
    vi. Type Y to reload the privilege tables and save your changes.


## 4. Install phpMyAdmin

phpMyAdmin is a web-based database management tool that you can use to view and edit MySQL databases on your EC2 instance. To install phpMyAdmin i used the following commands below

      sudo yum install php-mbstring php-xml -y
      (To install the required dependencies.)

      sudo systemctl restart httpd
      (To restart Apache.)

      sudo systemctl restart php-fpm
      (To restart php-fpm.)

      cd /var/www/html
      (Navigate to Apache document root at /var/www/html)

      wget https://www.phpmyadmin.net/downloads/phpMyAdmin-latest-all-languages.tar.gz

      (To select source package for the lastest phpMyAdmin)

      mkdir phpMyAdmin && tar -xvzf phpMyAdmin-latest-all-languages.tar.gz -C phpMyAdmin --strip-components 1

      (To create a phpMyAdmin folder and extract the package into it)

      rm phpMyAdmin-latest-all-languages.tar.gz

      (To delete the phpMyAdmin latest all language.tar .gz tarball)


Afterwards, i added my public IP Address slash the file name as seen below

     http://3.133.156.184//phpMyAdmin

You should see the phpMyAdmin login page below

![myphpadmin page](https://user-images.githubusercontent.com/105374941/186639801-b0e13970-ce9a-4e5f-a3f7-5d5681e5914d.png)


## Here are the screenshot.




![lmp1](https://user-images.githubusercontent.com/105374941/186640078-1b7c5447-1519-4a1c-bdbe-2387a57aeb3e.png)


![lmp2](https://user-images.githubusercontent.com/105374941/186640106-9fefa0c9-2c97-4f31-82e6-d53b98f23e19.png)


![lmp3](https://user-images.githubusercontent.com/105374941/186640152-d1f002f2-eafb-4b5d-aefe-c3c48ee6f2e4.png)


![lmp4](https://user-images.githubusercontent.com/105374941/186640252-758506b5-01e7-476c-ba1a-32bbf405eb88.png)


![lmp5](https://user-images.githubusercontent.com/105374941/186640322-841880f8-54c3-4409-8e45-65ef06711788.png)


![lmp6](https://user-images.githubusercontent.com/105374941/186640366-65297790-4388-4f86-b8fb-0fd6f2c99162.png)


![lmp7](https://user-images.githubusercontent.com/105374941/186640406-668d5881-8fab-4675-b4b9-67c8ef26282e.png)


![lmp8](https://user-images.githubusercontent.com/105374941/186641168-052f451d-0113-4c28-9675-23875dc92c0a.png)


![lmp9](https://user-images.githubusercontent.com/105374941/186641330-269e86f2-22cb-4d5c-a270-24b92cfdd675.png)


![lmp10](https://user-images.githubusercontent.com/105374941/186641583-d912ddd1-141f-4131-84ae-cc2258fe7b50.png)


![lmp11](https://user-images.githubusercontent.com/105374941/186641643-13883b88-b452-4d0f-83bc-815739caef36.png)


![lmp12](https://user-images.githubusercontent.com/105374941/186641718-ab91fc21-1783-499d-b7aa-581e17901a56.png)


![lmp13](https://user-images.githubusercontent.com/105374941/186641784-b305395a-25aa-4cd6-8736-a87e05308ff6.png)


![lmp14](https://user-images.githubusercontent.com/105374941/186641869-261137a5-b2e7-44a0-b2f3-b72f3e23c005.png)


![lmp15](https://user-images.githubusercontent.com/105374941/186641967-ddff4777-3f69-45e1-8e9f-d2961ecc7d16.png)


![lmp16](https://user-images.githubusercontent.com/105374941/186642047-c40c263d-0a8e-47e9-a8b6-cdfee8db33f2.png)


![lmp17](https://user-images.githubusercontent.com/105374941/186642072-86b5e109-faa9-496a-8c84-f2a7feda422a.png)


![lmp18](https://user-images.githubusercontent.com/105374941/186642128-da0eef12-ed10-4f6e-b86f-77b13d591f76.png)


![lmp19](https://user-images.githubusercontent.com/105374941/186642139-9c88d83e-ca51-42a8-b2c9-388670c58b69.png)


![lmp20](https://user-images.githubusercontent.com/105374941/186642268-366fd832-26aa-4274-8c3b-723bbc411954.png)

![lmp21](https://user-images.githubusercontent.com/105374941/186642316-b247449e-9cfd-4d3a-8061-36c6dc93f1a7.png)




