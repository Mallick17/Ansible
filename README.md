# Ansible
Ansible Installation &amp; Configuration along with Commands
| **Ansible-Master**                    | **Ansible-Worker**                        |
|--------------------------------------|------------------------------------------|
| **1.Ansible Installation**           |                |
| ```sudo amazon-linux-extras install ansible2 -y```            |                 |
| ```vi /etc/ansible/hosts```<br>[demo]<br>worker node Private IP  |    |
| <br>```[demo]```<br>```worker node Private IP```            |                  |
|                                      | ```sudo docker ps```                     |
| **4. Promote Worker to Manager (Optional)** |                                          |
| ```sudo docker node promote <Worker-Node-ID>``` |                              |

