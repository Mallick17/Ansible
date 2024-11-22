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
<br>

###  A playbook to check connection with worker nodes weather it is reachable or not by using target section in the file name `target.yml`.

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

































