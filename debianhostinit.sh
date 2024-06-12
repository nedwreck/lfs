!#/bin/bash
# Debian LFS Host Initialization Script

# Update and upgrade debian host
sudo apt update -y && \
sudo apt upgrade -y && \
sudo apt autoremove -y &&\

# Install ssh for Ansible
sudo apt install wget ssh -y &&\

# Permit root to log in from SSH and restart SSH
#sudo echo "PermitRootLogin yes" >> /etc/ssh/sshd_config &&\
echo "PermitRootLogin yes" | sudo tee -a /etc/ssh/sshd_config &&\
sudo systemctl restart ssh &&\

# Create a password for the root user
# Change this password if desired but it will only be set for the live system for the build
(echo 'password'; echo 'password') | passwd root
