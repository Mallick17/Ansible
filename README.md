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

###  A playbook to check connection with worker nodes weather it is reachable or not by using target section.

```yaml
---
- name: to check targets
  hosts: demo, mallick
  user: ansible
  become: yes
  connection: ssh
```
### A ansible-playbook script to install & start httpd service in the worker nodes.
```yaml
