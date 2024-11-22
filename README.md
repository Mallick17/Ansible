# Ansible Playbook & Scripts
- An Ansible Playbook is a file written in YAML format that defines a set of tasks or multiple tasks to be executed on managed nodes. 
- Playbooks allow for automated configuration, deployment, and orchestration of servers and services.
## Playbook Structure
```yaml
---
- name: Playbook description
  hosts: target_hosts
  become: yes  # Use privilege escalation (sudo)
  tasks:
    - name: Task description
      module_name: module_parameters
```
- **Key Components**
  1. **name**: Describes the playbook or task.
  2. **hosts**: Defines the target machines (groups or individual hosts from the inventory file eg. demo,mallick).
  3. **become**: If set to `yes`, it escalates privileges (uses `sudo`).
  4. **tasks**: A list of tasks to be executed. Each task uses a module (e.g., `yum`, `apt`, `file`, etc.) to perform an action.
---
### A playbook to check connection with worker nodes weather it is reachable or not by using target section in the file name `target.yml`.

```yaml
---
- name: to check targets
  hosts: demo, mallick
  user: ansible
  become: yes
  connection: ssh
```
- Once we have created the playbook, we can run it using the `ansible-playbook` command
```sh
ansible-playbook target.yml --check
ansible-playbook target.yml
```
---
### A ansible-playbook script to install & start httpd service in the worker nodes in the file name `starthttpd.yml`.
```yaml
---
- name: to check targets
  hosts: demo, mallick
  user: ansible
  become: yes
  connection: ssh
  tasks:
    - name: install httpd
      command: yum install httpd -y
    - name: start httpd service
      command: systemctl start httpd
```
- Once we have created the playbook, we can run it using the `ansible-playbook` command
```sh
ansible-playbook starthttpd.yml --check
ansible-playbook starthttpd.yml
```
---
### A ansible-playbook script to stop & remove httpd service in the worker nodes in the file name `stophttpd.yml`.
```yaml
---
- name: to check targets
  hosts: all
  user: ansible
  become: yes
  connection: ssh
  tasks:
    - name: stop httpd service
      command: systemctl stop httpd
    - name: uninstall httpd
      command: yum remove httpd -y
```
- Once we have created the playbook, we can run it using the `ansible-playbook` command
```sh
ansible-playbook stophttpd.yml --check
ansible-playbook stophttpd.yml
```
---
## Variables in Playbooks
- We can define variables to use in our playbooks. This allows for flexibility and customization.
```yml
---
- name: Install and configure Git
  hosts: all
  become: yes
  vars:
    git_user: "admin"
    git_email: "admin@example.com"
  tasks:
    - name: Install Git
      yum:
        name: git
        state: present

    - name: Configure Git user
      command: git config --global user.name "{{ git_user }}"
    - name: Configure Git email
      command: git config --global user.email "{{ git_email }}"
```
- Playbook to install httpd and to start the httpd service using variables
```yaml
---
- name: Install and start httpd service
  hosts: mallick
  user: ansible
  become: yes
  connection: ssh
  vars:
    pkg_name: httpd
  tasks:
    - name: install httpd
      yum:
        name: "{{ pkg_name }}"
        state: present

    - name: start httpd service
      service:
        name: "{{ pkg_name }}"
        state: started
```
---
## Conditional Execution in Playbooks
- You can execute tasks conditionally using the `when` statement.
```yaml
---
- name: Install Apache only on Debian-based systems
  hosts: all
  become: yes
  tasks:
    - name: Install Apache (Debian)
      apt:
        name: apache2
        state: present
      when: ansible_os_family == "Debian"

    - name: Install Apache (RedHat)
      yum:
        name: httpd
        state: present
      when: ansible_os_family == "RedHat"
```
- Here:
  - when: Ensures that Apache is installed only on the appropriate operating system family (Debian or RedHat).
---
## Loops in Playbooks
- You can use loops to iterate over a list of items and perform the same task on each item.
```yaml
---
- name: Install multiple packages
  hosts: all
  become: yes
  tasks:
    - name: Install packages
      yum:
        name: "{{ item }}"
        state: present
      loop:
        - vim
        - curl
        - wget
``` 
- **Note**: The loop iterates over the list of packages and installs each one.
---
## Handlers in Playbooks
- Handlers are special tasks that are only executed when notified by another task. Handlers are usually used to restart services after making changes.
### A script to install service, once it is installed it has to botify to start the service by using handlers section.
```yaml
---
- name: to check targets
  hosts: mallick
  user: ansible
  become: yes
  connection: ssh
  tasks:
    - name: install nginx
      shell: yum install nginx -y
      notify: start nginx service
  handlers:
    - name: start nginx service
      shell: systemctl start nginx
```
- And then to configure and restart the nginx service.
```yaml
---
- name: Configure and restart Nginx
  hosts: all
  become: yes
  connection: ssh
  tasks:
    - name: Update Nginx configuration
      copy:
        src: nginx.conf
        dest: /etc/nginx/nginx.conf
      notify:
        - restart nginx

  handlers:
    - name: restart nginx
      service:
        name: nginx
        state: restarted
```
- Note:
  - The notify keyword tells Ansible to notify the handler (`restart nginx`) when the Update Nginx configuration task is successful.
  - The handler restarts Nginx to apply the changes.
---

































