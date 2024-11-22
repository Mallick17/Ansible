# Ansible: Ad-hoc Commands

## Introduction
Ansible ad-hoc commands manage remote servers effectively. Ad-hoc commands are simple, one-liner instructions that allow you to perform tasks quickly without writing a playbook.

---

## Prerequisites
1. **Ansible Installation**: Ensure Ansible is installed on your control node. [Refer to the documentation](https://github.com/Mallick17/Ansible/tree/Ansible_install-%26-Configure).
2. **Inventory Setup**: Define your inventory file with groups like `demo` and `mallick`. Example:

   ```ini
   [demo]
   192.168.1.10 ansible_user=ec2-user ansible_ssh_private_key_file=/path/to/key

   [mallick]
   192.168.1.20 ansible_user=ec2-user ansible_ssh_private_key_file=/path/to/key
   
3. **Remote Server Access**: Rnsure you can SSH into the servers with `ssh@private-ip` with password or with `ssh-keygen`.

# Ad-hoc Commands Overview
**An Ansible ad hoc command uses the /usr/bin/ansible command-line tool to automate a single task on one or more managed nodes. ad hoc commands are quick and easy, but they are not reusable.**
```ini
ansible <group-name> -a "<arguments>"
```

1. **Ping Test**
   - To check if Ansible can reach the hosts
     ```ini
     ansible demo -m ping
     ansible mallick -m ping
     ```
   
2. **File operations**
   - Create a File:
     ```ini
     ansible demo -a "touch sample.txt"
     ansible mallick -a "touch index.html"
     ```
   - List Files:
     ```ini
     ansible demo -a "ls"
     ansible mallick -a "ls"
     ```
3. **Install Packages**
   - Install Apache
     ```ini
     ansible demo -a "sudo yum install httpd -y"
     ```
   - Install NGINX
     ```ini
     ansible mallick -a "sudo amazon-linux-extras install nginx1 -y"
     ```
4. **Service Management**
   - Check Service Status
     ```ini
     ansible demo -a "sudo systemctl status httpd"
     ansible mallick -a "sudo systemctl status nginx"
      ```
   - Start Services
     ```ini
     ansible demo -a "sudo systemctl start httpd"
     ansible mallick -a "sudo systemctl start nginx"
     ```
   - Stop Services
     ```ini
     ansible demo -a "sudo systemctl stop httpd"
     ansible mallick -a "sudo systemctl stop nginx"
     ```
5. **Uninstall Packages**
   - Remove Apache
     ```ini
     ansible demo -a "sudo yum remove httpd -y"
     ```
   - Remove NGINX
     ```ini
     ansible mallick -a "sudo yum remove nginx -y"
     ```
6. **Become Sudo User(Sudo Privileged or Master Permisssions)**
   - **Use `-b` for privilege escalation.**
     - Install
       ```ini
       ansible demo -b -a "yum install httpd -y"
       ansible mallick -b -a "amazon-linux-extras install nginx1 -y"
       ```
     - Remove
       ```ini
       ansible demo -b -a "yum remove httpd -y"
       ansible mallick -b -a "yum remove nginx -y"
       ```
# Ansible: Module Commands
## Introduction
Module commands are reuseable commands to execute in  the worker node. These modules are essential building blocks for managing infrastructure and automation tasks with Ansible.

---

## General Syntax
```bash
ansible <target> -m <module> -a "<arguments>" [options]
```
- `<target>`: Inventory group or hostname.
- `<module>`: Module name (e.g., `ping`, `copy`, `yum`).
- `<arguments>`: Arguments required for the module.
- `[options]`: Additional flags like -b for privilege escalation.

## Commonly used Ansible Modules and their Commands.
1. **Ping Module**
   - Tests connectivity between the Ansible control node and managed hosts.
     ```ini
     ansible all -m ping   ##It tests connectivity in all the hosts
     ansible demo -m ping   ##It tests connectivity in the demo group hosts.
     ansible mallick -m ping   ##It tests connectivity in the mallick group hosts.
     ```
2. **Command Module**
   - Executes commands on remote hosts without using a shell. Use it for simple commands where no environment variables, pipes, or redirections are needed.
     ```bash
     ansible all -m command -a "uptime"         ## Retrieves uptime for all hosts
     ansible demo -b -m command -a "uptime"    ## Retrieves uptime for demo group with sudo privileges
     ansible mallick -b -m command -a "uptime" ## Retrieves uptime for mallick group with sudo privileges
     ```
3. **Shell Module**
   - Executes shell commands on remote hosts.
     ```ini
     ansible all -m shell -a "echo Hello World > /tmp/hello.txt"  ## Creates a file with 'Hello World' text
     ansible all -m shell -a "echo Hello World > //home/ansible/hello.txt"
     ansible demo -m shell -a "pwd"
     ansible mallick -m shell -a "ls"
     ansible all -m shell -a "mkdir ansiblefolder"
     ansible demo -m shell -a "pwd"                              ## Prints the working directory on demo group hosts
     ansible mallick -m shell -a "ls"                            ## Lists files in the mallick group hosts
     ```
4. **Copy Module**
   - Copies files from the control node to remote hosts.
     ```ini
     [ansible@master ~]$vi local.txt
     ansible all -b -m copy -a "src=/home/ansible/local.txt dest=/home/ansible/ansiblefolder/local.txt"
     ansible demo -m copy -a "src=local.txt dest=/home/ansible/codedeploy/local.txt"         ## Copies 'local.txt' to demo hosts
     ```
5. **File Module**
   - Manages file and directory properties.
     ```ini
     ansible all -m file -a "path=/tmp/sample.txt mode=0644"        ## Sets permissions for the file
     ansible demo -m file -a "path=/tmp/new_directory state=directory"  ## Creates a directory on demo hosts
     ansible mallick -m file -a "path=/tmp/old_file state=absent"   ## Removes a file on mallick hosts
     ```
6. **Yum Module**
   - Manages packages on RHEL-based systems.
     ```ini
     ansible demo -b -m yum -a "name=httpd state=present"  ## Installs Apache HTTP server on demo hosts
     ansible mallick -b -m yum -a "name=nginx state=absent" ## Removes NGINX from mallick hosts
     ansible all -b -m yum -a "name=* state=latest"        ## Updates all packages on all hosts
     ```
7. **Apt Module**
   - Manages packages on Debian-based systems.
     ```ini
     ansible demo -b -m apt -a "name=nginx state=present"  ## Installs NGINX on demo hosts
     ansible mallick -b -m apt -a "name=nginx state=absent"## Removes NGINX from mallick hosts
     ansible all -b -m apt -a "update_cache=yes"           ## Updates the package cache on all hosts
     ```
8. **Service Module**
   - Manages services on remote hosts.
     ```ini
     ansible demo -b -m service -a "name=httpd state=started"   ## Starts Apache on demo hosts
      ansible mallick -b -m service -a "name=nginx state=stopped" ## Stops NGINX on mallick hosts
      ansible demo -b -m service -a "name=httpd enabled=yes"     ## Enables Apache on demo hosts to start on boot
     ```
9. **User Module**
    - Manages user accounts
      ```ini
      ansible all -m user -a "name=newuser state=present"        ## Creates a new user on all hosts
      ansible mallick -m user -a "name=olduser state=absent"     ## Deletes a user on mallick hosts
      ```
10. **Setup Module**
    - Gathers facts about remote hosts.
      ```ini
      ansible all -m setup                                       ## Displays all facts about all hosts
      ansible demo -m setup -a "filter=ansible_distribution"    ## Displays OS distribution info for demo hosts
      ansible mallick -m setup -a "filter=ansible_memtotal_mb"  ## Displays total memory info for mallick hosts
      ```
11. **Git Module**
    - Clones or updates a repository from Git.
      ```ini
      ansible all -m git -a "repo=https://github.com/example/repo.git dest=/tmp/repo" ## Clones a repository to all hosts
      ansible demo -m git -a "repo=https://github.com/example/repo.git dest=/tmp/repo version=main" ## Clones the main branch
      ```
12. **Debug Module**
    - Prints debug information for troubleshooting.
      ```ini
      ansible all -m debug -a "msg='Hello, Ansible!'"            ## Prints 'Hello, Ansible!' on all hosts
      ansible demo -m debug -a "msg='Debugging Demo Group!'"     ## Prints a debug message for demo hosts
      ```
13. **Cron Module**
    - Manages cron jobs.
      ```ini
      ansible all -m cron -a "name='Backup Job' minute=0 hour=2 job='/usr/bin/backup.sh'" ## Adds a cron job
      ansible demo -m cron -a "name='Backup Job' state=absent" ## Removes the cron job on demo hosts
      ```
14. **Stat Module**
    - Retrieves file or directory metadata.
      ```ini
      ansible all -m stat -a "path=/tmp/sample.txt"              ## Checks metadata for a file on all hosts
      ansible mallick -m stat -a "path=/tmp/important.log"       ## Checks metadata for a file on mallick hosts
      ```
15. **Privilege Escalation**
    - Use the -b option to execute commands requiring sudo privileges.
      ```ini
      ansible demo -b -m yum -a "name=httpd state=present"       ## Installs Apache with sudo privileges
      ansible mallick -b -m shell -a "systemctl restart nginx"  ## Restarts NGINX with sudo privileges
      ```











   


       

     





