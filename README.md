# Ansible Installation & Configuration 

# Ansible Installation & Configuration between Master & Worker Node
  | **Ansible-Master**                    | **Ansible-Worker**                        |
  |--------------------------------------|------------------------------------------|
  | **1.Ansible Installation**           |                |
  | ```sudo amazon-linux-extras install ansible2 -y```            |                 |
  | ```vi /etc/ansible/hosts```>>Line No:12<br>```[demo]```<br>```worker node Private IP```  |    |
  | ```vi /etc/ansible/ansible.cfg```<br>removing ```#```<br>```inventory =/etc/ansible/hosts```<br>```sudo_user=root```           |                  |
  | ```useradd ansible```                 | ```useradd ansible```                    |
  | ```passwd ansible```                 | ```passwd ansible```                    |
  | ```visudo```<br>#Allow root to<br>root All=(ALL)  ALL<br>```ansible ALL=(ALL) NOPASSWD: ALL``` >>Line No:101                 | ```visudo```<br>#Allow root to<br>root All=(ALL)  ALL<br>```ansible ALL=(ALL) NOPASSWD: ALL``` >>Line No:101|
  | ```vi /etc/ssh/sshd_config```<br>#Authentication<br>removing ```#``` ```PermitRootLogin yes``` >>Line No:38<br>```PasswordAuthentication yes``` >>Line No:63    | ```vi /etc/ssh/sshd_config```<br>#Authentication<br>removing ```#``` ```PermitRootLogin yes``` >>Line No:38<br>```PasswordAuthentication yes``` >>Line No:63|
  | ```service sshd restart```                 | ```service sshd restart```                    |
  | ```su - ansible```                 | ```su - ansible```                    |
  | ```ssh worker node Private IP```<br>password:```1234```       |                          |

---
 # Generating SSH Key and Setting Up Access

Follow these steps to generate an SSH key on the Ansible-Master and set up access to the Worker node.

## 1. Generate SSH Key on Ansible-Master

Open a terminal on the Ansible-Master and execute the following command:

  ### Ansible-Master
  ```sh
  ssh-keygen
  ```
  ### Press Enter three times to accept the default options.
  Enter<br>Enter<br>Enter
  ### List all files in the current directory to verify the creation of the key
  ```sh
  ls -a
```
  ### Navigate to the .ssh directory
  ```sh 
  cd .ssh
```
  ### View the contents of the generated SSH key
  ```sh
  cat id_rsa
```
   #### Note: Copy the entire contents of the key displayed.
## 2. Copy the SSH Key to the Worker Node
  ```sh
  ssh-copy-id ansible@worker node Private IP
```
  #### password: 1234
## 3. Verify SSH Access to the Worker Node
  ### Return to the previous directory
  ```sh
  cd ..
```
  ### Test the SSH access to the Worker node
  ```sh
  ssh worker node Private IP
```
  #### This command checks the accessibility between the Ansible-Master and the Worker node.
  ### Exit the SSH session
  ```sh
  exit
```
## 4. Test Ansible Connectivity To ensure that Ansible can communicate with the Worker node
  ```sh
  ansible demo -m ping
```
---
# Ansible Vault: Encrypting and Decrypting Files

Ansible Vault is a powerful tool to securely manage sensitive data such as passwords, API keys, and other secrets in Ansible projects.

## Commands for Encryption and Decryption

1. **Encrypt a File**
   - Secures the content of a file, making it unreadable without a Vault password.
     ```bash
     ansible-vault encrypt <filename>         ## Encrypts the specified file
     ansible-vault encrypt secrets.yml        ## Example: Encrypts secrets.yml
     ```
   - You will be prompted to enter a new Vault password.

2. **View an Encrypted File**
   - Displays the content of an encrypted file in plaintext without decrypting it.
     ```bash
     ansible-vault view <filename>            ## Views the content of the specified file
     ansible-vault view secrets.yml           ## Example: Views the content of secrets.yml
     ```
   - Requires the Vault password to access the content.

3. **Edit an Encrypted File**
   - Opens an encrypted file in an editor, allowing modifications. The file is automatically re-encrypted upon saving.
     ```bash
     ansible-vault edit <filename>            ## Edits the specified file securely
     ansible-vault edit secrets.yml           ## Example: Edits secrets.yml
     ```
   - Requires the Vault password to edit the file.

4. **Decrypt a File**
   - Removes encryption from the file, making it readable in plaintext.
     ```bash
     ansible-vault decrypt <filename>         ## Decrypts the specified file
     ansible-vault decrypt secrets.yml        ## Example: Decrypts secrets.yml
     ```
   - Requires the Vault password to perform decryption.

---

## Automating Vault Password Handling

1. **Using a Password File**
   - Create a file to store the Vault password securely:
     ```bash
     echo "your_password" > /path/to/vault_password_file
     ```
   - Set the password file in `ansible.cfg`:
     ```ini
     [defaults]
     vault_password_file = /path/to/vault_password_file
     ```

2. **Run Playbooks with Automation**
   - Specify the Vault password file when running playbooks:
     ```bash
     ansible-playbook playbook.yml --vault-password-file /path/to/vault_password_file
     ```

---

## Example Workflow

1. **Encrypt a File**:
   ```bash
   ansible-vault encrypt credentials.yml
