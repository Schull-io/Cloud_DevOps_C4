# Week 3 Tasks can be found below

Step 1: Work with the commands,
Step 2: Do a screenshooot.
Step 3: Atached proof in your local machine and push to the remote repo.



# List the files of a directory using the ls command
List the content of your home directory
List the content of <name_of_directory> by using its absolute path and then its relative path using the ```console
ls
``` command
List the content of the directory <name_of_directory> with the ```console
ls
``` command and the option -R

List the content of the directory <name_of_directory> with the ls command and the option -R

# List the files using the ls command and metacharacter *
List all the content of the directory
List only files that start with egg in the directory <name_of_directory>
List only files with the .jpg extensions in the image directory

# Moving in and out of a file system using the cd and ls command

Go to the Audio directory and check if its correct using the command pwd
List the content with ls
go to the previous directory using ```console
../
```
list the content of the image directory using -R option
Go back to your home directory.

# Ls command

1. List all files in the current directory, including hidden files: ls -a
2. List all files in the current directory, including hidden files, and show their file sizes: ls -lh
3. List all files in the current directory sorted by modification time: ls -lt
4. List only directories in the current directory: ls -d */
5. List all files in the current directory, including hidden files, and display them in a long format with the owner's name: ls -l --show-control-chars --group-directories-first --author
6. List all files in the current directory and its subdirectories: ls -R
7. List all files in the current directory and its subdirectories, including hidden files: ls -R -a
8. List all files in the current directory and its subdirectories, sorted by file size: ls -R -S
9. List all files in the current directory and its subdirectories, showing their inode numbers: ls -R -i
10. List all files in the current directory and its subdirectories, showing the file type and permissions: ls -R -F

# Cp cmd

1. Copy a file from one directory to another: cp /path/to/source/file.txt /path/to/destination/
2. Copy multiple files at once: cp file1.txt file2.txt file3.txt /path/to/destination/
3. Copy a directory and its contents: cp -r /path/to/source/directory/ /path/to/destination/
4. Preserve the permissions of the original file when copying: cp -p /path/to/source/file.txt /path/to/destination/
5. Overwrite an existing file without prompting: cp -f /path/to/source/file.txt /path/to/destination/
6. Copy multiple files and rename them in the process: cp file1.txt file2.txt /path/to/destination/new_name1.txt new_name2.txt
7. Copy a file and create a backup of the original file: cp -b /path/to/source/file.txt /path/to/destination/
8. Copy a file and update the modified and access times of the copy: cp -p --preserve=timestamps /path/to/source/file.txt /path/to/destination/
9. Copy a file and only copy the part of the file between two specified offsets: cp --sparse=always --input-range=offset1:offset2 /path/to/source/file.txt /path/to/destination/
10. Copy a file and show progress while copying: cp -v /path/to/source/file.txt /path/to/destination/


# Mv cmd
1. Rename a file: mv old_name.txt new_name.txt
2. Move a file to a different directory: mv file.txt /path/to/destination/
3. Move multiple files to a different directory: mv file1.txt file2.txt file3.txt /path/to/destination/
4. Move a directory and its contents: mv -r /path/to/source/directory/ /path/to/destination/
5. Overwrite an existing file without prompting: mv -f /path/to/source/file.txt /path/to/destination/
6. Move a file and create a backup of the original file: mv -b /path/to/source/file.txt /path/to/destination/
7. Move a file and update the modified and access times of the copy: mv -p --preserve=timestamps /path/to/source/file.txt /path/to/destination/
8. Move a file and only copy the part of the file between two specified offsets: mv --sparse=always --input-range=offset1:offset2 /path/to/source/file.txt /path/to/destination/
9. Move a file and show progress while copying: mv -v /path/to/source/file.txt /path/to/destination/
10. Rename a file and change its file permissions at the same time: mv -v --preserve=mode /path/to/source/file.txt /path/to/destination/new_name.txt

# I/o redirection
1. Redirect the output of a command to a file: ls -l > file.txt
2. Append the output of a command to a file: ls -l >> file.txt
3. Redirect the output of a command to another command: ls -l | wc -l
4. Redirect the output and error messages of a command to a file: ls -l /non-existent-directory/ 2> error.txt
5. Redirect the error messages of a command to a file and display the output on the console: ls -l /non-existent-directory/ 2> error.txt 1>&2
6. Redirect the output and error messages of a command to separate files: ls -l /non-existent-directory/ 2> error.txt 1> output.txt
7. Redirect the output of a command to another command and also save it to a file: ls -l | tee file.txt | wc -l
8. Redirect the output of a command to another command and suppress the output to the console: ls -l | tee /dev/null | wc -l
9. Read a command's input from a file: sort < input.txt
10. Read a command's input from the output of another command: sort <(ls -l)

# Using pipes
1. Use grep to filter the output of ls: ls -l | grep "\.txt"
2. Use awk to extract fields from the output of ls: ls -l | awk '{print $9}'
3. Use sed to modify the output of ls: ls -l | sed 's/^/ /'
4. Use uniq to remove duplicate lines from the output of ls: ls -l | uniq
5. Use head to display only the first few lines of the output of ls: ls -l | head -n 5

# Using vi/vim to edit text files

1. Open a file in vi: vi file.txt
2. Navigate through the file using the arrow keys or h, j, k, l keys
3. Enter insert mode by pressing i and type or paste text into the file
4. Save the file and exit vi by pressing Esc, then typing :wq and pressing Enter
5. Open a new file in vi and save it with a different name: vi new_file.txt
6. Revert to a previous version of the file by pressing Esc, then typing :e! and pressing Enter
7. Search for a string in the file by pressing Esc, then typing /string and pressing Enter
8. Replace all occurrences of a string in the file by pressing Esc, then typing :%s/old_string/new_string/g and pressing Enter
9. Go to a specific line number by pressing Esc, then typing :line_number and pressing Enter
10. Split the window into multiple panes by pressing Ctrl + w followed by v or h to split vertically or horizontally, respectively. Navigate between panes using Ctrl + w followed by h, j, k, or l.


# Using ssh
Connect to a remote server using SSH: ssh user@server
Connect to a remote server using a private key file: ssh -i /path/to/private_key user@server
Connect to a remote server and run a command without entering the shell: ssh user@server "command"
Connect to a remote server using a different user name: ssh -l username user@server

# Users and groups
1. Add a new user: useradd username
2. Set a password for a user: passwd username
3. Delete a user: userdel username
4. Add a user to a group: usermod -a -G groupname username
5. Create a new group: groupadd groupname
6. Delete a group: groupdel groupname
7. Change a user's primary group: usermod -g groupname username
8. Change a user's secondary groups: usermod -G group1,group2,group3 username
9. Change the name of a group: groupmod -n new_groupname groupname
10. Change the group ID of a group: groupmod -g new_gid groupname
