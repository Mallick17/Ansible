# Ansible Installation &amp; Configuration along with Commands

# Ansible Installation & Configuration between Master & Worker Node
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
  | ```service sshd restart```                 | ```service sshd restart```                    |
  | ```su - ansible```                 | ```su - ansible```                    |
  | ```ssh worker node Private IP```<br>password:```1234```       |                          |

  # Generating SSH Key Gen
  ### Ansible-Master
  ```ssh-keygen```<br>
  Enter<br>Enter<br>Enter<br>
  ```ls -a```<br>
  ```cd .ssh```<br>```cat id_rsa``` >>Copy the generated key<br>
  ```ssh-copy-id ansible@worker node Private IP```<br>```password: 1234```
  <br> cd ..<br>```ssh worker node Private IP``` >>to check accesibility between Master and Worker Node<br>
  ```exit```<br>```ansible demo -m ping```
  


