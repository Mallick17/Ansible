# Ansible
Ansible Installation &amp; Configuration along with Commands
| **Ansible-Master**                    | **Ansible-Worker**                        |
|--------------------------------------|------------------------------------------|
| **1.Ansible Installation**           |                |
| ```sudo amazon-linux-extras install ansible2 -y```            |                 |
| ```vi /etc/ansible/hosts```<br>```[demo]```<br>```worker node Private IP```  |    |
| ```vi /etc/ansible/ansible.cfg```<br>removing ```#```<br>```inventory =/etc/ansible/hosts```<br>```sudo_user=root```           |                  |
| ```useradd ansible```                 | ```useradd ansible```                    |
| ```passwd ansible```                 | ```passwd ansible```                    |
| ```visudo```<br>#Allow root to<br>root All=(ALL)  ALL<br>```ansible ALL=(ALL) NOPASSWD: ALL``` >>Line No:101                 | ```visudo```<br>#Allow root to<br>root All=(ALL)  ALL<br>```ansible ALL=(ALL) NOPASSWD: ALL``` >>Line No:101|
| ```vi /etc/ssh/sshd_config```<br>#Authentication<br>removing ```#``` ```PermitRootLogin yes``` >>Line No:38<br>```PasswordAuthentication yes``` >>Line No:63    | ```vi /etc/ssh/sshd_config```<br>#Authentication<br>removing ```#``` ```PermitRootLogin yes``` >>Line No:38<br>```PasswordAuthentication yes``` >>Line No:63|


