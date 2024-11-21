# Ansible: Ad-hoc Commands

## Introduction
This guide demonstrates how to use Ansible ad-hoc commands to manage remote servers effectively. Ad-hoc commands are simple, one-liner instructions that allow you to perform tasks quickly without writing a playbook.

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
This guide provides an overview of commonly used Ansible modules and their commands. These modules are essential building blocks for managing infrastructure and automation tasks with Ansible.

---

## General Syntax
```bash
ansible <target> -m <module> -a "<arguments>" [options]
```
- `<target>`: Inventory group or hostname.
- `<module>`: Module name (e.g., `ping`, `copy`, `yum`).
- `<arguments>`: Arguments required for the module.
- `[options]`: Additional flags like -b for privilege escalation.

       

     





