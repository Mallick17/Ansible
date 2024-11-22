ssh 172.31.10.99
ssh 172.31.6.221
ssh 172.31.11.72
ssh-keygen
ls -a
cd .ssh
cat id_rsa
ssh-copy-id ansible@172.31.11.72
ssh-copy-id ansible@172.31.6.221
ssh-copy-id ansible@172.31.10.99
ssh 172.31.10.99
ssh 172.31.6.221
ssh 172.31.11.72
ansible demo -m ping
cd
ansible demo -a "pwd"
exit
ansible demo -m ping
ansible mallick -m ping
ansible demo -a "pwd"
ansible demo -a "touch sample.txt"
ansible demo -a "ls"
ansible mallick -a "touch index.html"
ansible mallick -a "ls"
ansible demo -a "sudo yum install httpd -y"
ansible mallick -a "sudo yum install nginx -y"
ansible mallick -a "sudo yum install nginx1 -y"
ansible mallick -a "sudo amazon-linux-extras install nginx1 -y"
ansible demo -a "sudo systemctl status  httpd"
ansible mallick -a "sudo systemctl status  nginx1"
ansible mallick -a "sudo systemctl status  nginx"
ansible demo -a "sudo systemctl start  httpd"
ansible demo -a "sudo systemctl status  httpd"
ansible mallick -a "sudo systemctl start  nginx"
ansible mallick -a "sudo systemctl status  nginx"
ansible mallick -a "sudo systemctl stop  nginx"
ansible demo -a "sudo systemctl stop  httpd"
ansible mallick -a "sudo systemctl status  nginx"
ansible demo -a "sudo systemctl status  httpd"
ansible demo -a "sudo systemctl stop httpd"
ansible demo -a "sudo yum remove httpd -y"
ansible mallick -a "sudo yum remove nginx -y"
ansible demo -b -a "yum install httpd -y"
ansible mallick -b -a "amazon-linux-extras install nginx1 -y"
ansible demo -b -a "yum remove httpd -y"
ansible mallick -b -a "amazon-linux-extras remove nginx1 -y"
ansible mallick -b -a "yum remove nginx -y"
history
