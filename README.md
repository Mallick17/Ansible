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



