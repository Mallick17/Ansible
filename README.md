# Ansible Guide: Ad-hoc Commands

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
