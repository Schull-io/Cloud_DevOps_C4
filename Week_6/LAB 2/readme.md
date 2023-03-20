# LAB:  Host a WordPress blog on Amazon Linux 

Task:

1. Download word press installation package.
Input this line of wget command in your shell to install wordpress 

wget https://wordpress.org/latest.tar.gz


2. Create a database user and database for your WordPress installation
3. Create and edit the wp-config.php file (use the guide
4. Install your WordPress files under the Apache document root)
5. Install the PHP graphics drawing library on Amazon Linux 2.
6. Create an AMI of this running instance.
7. Perform clean up operations.





Guide:
https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/hosting-wordpress.html

Grading tip:  Screenshot major script/console outputs and upload with your step by step answer









## Lab Experience


## 1. Download word press installation package.

I started by launched an instance then ssh it to connect the instance CLI, when i connected i then ran this line of wget command below in my shell to install the latest wordpress package

_wget https://wordpress.org/latest.tar.gz_

And i ran this command below to unzip and unarchive the installation package

         _tar -xzf latest.tar.gz_


## 2. Create a database user and database for your WordPress installation.

Wordpress installation needs to store informations, such as post and user comments. installing a database user helps create blog database and users that are authorized to read and save information to it 
i ran various command to create and install the database for the wordpress

To start the database server

   _sudo systemctl start mariadb_

Meanwhile i did not start the mariadb like that , i had installed it in the previous lab so it was easy to start

Afterwards i logged in to the database server as the root server and entered the database server root password i had created when installing the mariadb in the previous Lab.

i achieved that by running the command below
     
         _mysql -u root -p_

I created a user and password on MySQL which give access to my installed wordpress to communicate with the database in MySQL. with the command below
 
   
CREATE USER 'wordpress-user'@'localhost' IDENTIFIED BY _'your_strong_password'

(Meanwhile i gave it my customized definition and identity)

Furthermore, i created my database(To be more descriptive and have a meaningful name), i granted full privleges for my database to the wordpress user i created earlier, then flushed my database privileges to pick up all the changes and then exited MySQL...

i did all that with following command below

     CREATE DATABASE `wordpress-db`;

    GRANT ALL PRIVILEGES ON `wordpress-db`.* TO "wordpress-user"@"localhost";

    FLUSH PRIVILEGES;

    exit


## 3. Create and edit the wp-config.php file

I copied the wp-config-sample.php to a file called wp-config-php as given in the guide...which creates a new configuration file and keep the original sample file intact as back-up

below is the command i copied to my shell
   
      _cp wordpress/wp-config-sample.php wordpress/wp-config.php_

Afterwards, i had to edit the wp-config.php(i.e. the new configuration from the last command ran), meanwhile i can only edit these text-editor(nano or vim).. as given in the guide i used the nano text editor by running the command below into my shell ...

       _nano wordpress/wp-config.php_

I got a feedback after running the command then edited the lines that defines the following

   ('DB_NAME', 'wordpress-db')

   ('DB_USER', 'wordpress-user')

   ('DB_PASSWORD', 'DANIEL')

i edited the following above to the name i created in the previous step...

Also, i edited the authentication unique keys and salts, at first i was so confused as to how to get it but then i followed this link https://api.wordpress.org/secret-key/1.1/salt/ and i was able to generate key values 


## 4. Install your WordPress files under the Apache document root.

Now that i have unzipped the installation folder and and created a mySQL database and user customized for the wordpress configuration file, i proceeded by copying the command as given to us in the guide to install the files to my webserver document root script that complete the installation.

Below are the command i ran to achieve this
   
   cp -r wordpress/* /var/www/html/

Meanwhile, wordpress permalinks need to use Apache.htaccess files to work properly, but this is not enabled by default on Amazon linux. i achieved this by running this command below

    sudo vim /etc/httpd/conf/httpd.conf (To open the httpd.conf file)

    After running command i found a section that starts with <Directory "/var/www/html">... that require me to change the AllowOverride None to AllowOverride ALL as stated in the guide and then i saved the and exited from text editor.

## 5. Install the PHP graphics drawing library on Amazon Linux 2.

The PHP GD library enables you to modify images. I used the following command to install the PHP graphics drawing library on amazon linux 2

        sudo yum install php-gd

i had permit the apache web server by running the following command -- sudo chown -R apache /var/www
   
   sudo chgrp -R apache /var/www
   
   sudo chmod 2775 /var/www
   
   find /var/www -type d -exec sudo chmod 2775 {} \;
   
   find /var/www -type f -exec sudo chmod 0644 {} \;

Then i restarted the Apache web server to pick up the new group and permission
        
        sudo systemctl restart httpd

Now we are ready to install wordpress installation

sudo systemctl enable httpd && sudo systemctl enable mariadb
(To ensure that httpd and database service start at every system boot)

sudo systemctl status mariadb

(Verify that the database server is running)

 sudo systemctl start mariadb
 
 (If the database service is not running, start it)

 sudo systemctl status httpd

(if the httpd service is not running, start it)


## 6. Create an AMI of this running instance.




## Here Are the Screenshot

![updt](https://user-images.githubusercontent.com/105374941/187797853-74a18902-912e-4e21-9fbd-ccd996c0e21c.png)


![updt complete](https://user-images.githubusercontent.com/105374941/187797822-40b12007-7fa8-4231-9282-c07dec092582.png)

![first](https://user-images.githubusercontent.com/105374941/187797923-64233df2-b4f0-4ec2-b1a3-9e202ebad7be.png)

![secnd](https://user-images.githubusercontent.com/105374941/187797944-3bb04603-5690-4ab5-91b3-fddd2723fab2.png)

![wk4 lb4](https://user-images.githubusercontent.com/105374941/187798276-68fccb28-1089-48ff-ad20-82f07e24de18.png)

![wk4 lb4-01](https://user-images.githubusercontent.com/105374941/187798305-4be86ba8-53fa-47bf-997b-939b1b6fe567.png)

![wk4 lb4-02](https://user-images.githubusercontent.com/105374941/187798361-646edd43-0c6a-47ac-a7a2-cfddb6c4a0f0.png)

![wk4 lb4-03](https://user-images.githubusercontent.com/105374941/187798953-844995e8-6968-4097-b9bb-208bd07ca4bf.png)

![wk4 lb-04](https://user-images.githubusercontent.com/105374941/187798989-3e0635a7-21e8-41a0-99b9-898e69fcd1a8.png)

![wk4 lb-05](https://user-images.githubusercontent.com/105374941/187799049-2a5675f3-83ba-4cea-ab28-c7356b32e56b.png)

![wk4 lb-06](https://user-images.githubusercontent.com/105374941/187799061-49a161a4-579d-418e-8640-a784026a701b.png)

![wk4 lb-07](https://user-images.githubusercontent.com/105374941/187799097-4f098753-9fcf-44c8-982f-36e3ed4cb5be.png)

![wk4 lb4-08](https://user-images.githubusercontent.com/105374941/187799130-211ae06a-ce8f-4ab8-8a38-3bfb42dced31.png)

![wk4 lb4-09](https://user-images.githubusercontent.com/105374941/187799173-fd92189a-6237-491d-88f4-a01dc188adf2.png)

![third ](https://user-images.githubusercontent.com/105374941/187797976-c3d8613b-facb-4a47-8628-0e6ed0b819e1.png)

![fourth](https://user-images.githubusercontent.com/105374941/187798000-fa99c757-e7ec-4066-9485-d75c818361bc.png)

![fifth](https://user-images.githubusercontent.com/105374941/187799248-2be10303-1305-4b7b-a8e7-114c829dd1a5.png)




