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
# Ansible Module Commands
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
   - Executes commands on remote hosts (does not use a shell).
     ```ini
     ansible all -m command -a "uptime"
     ```
3. **Shell Module**
   - Executes shell commands on remote hosts.
     ```ini
     ansible all -m shell -a "echo Hello World > /tmp/hello.txt"  ## Creates a file with 'Hello World' text
     ansible demo -m shell -a "pwd"                              ## Prints the working directory on demo group hosts
     ansible mallick -m shell -a "ls"                            ## Lists files in the mallick group hosts
     ```
4. **Copy Module**
   - Copies files from the control node to remote hosts.
     ```ini
     ansible all -m copy -a "src=/path/to/local/file dest=/path/to/remote/file"  ## Copies file to all hosts
     ansible demo -m copy -a "src=sample.txt dest=/home/demo/sample.txt"         ## Copies 'sample.txt' to demo hosts
     ```


   


       

     





