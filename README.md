# DigitalOcean Base Image

This project intends to generate with [Packer](https://www.packer.io/) a base image/snapshot for incremental/base droplets that can easly integrate with your CI/CD process from a Centos 7.4 x64 machine. 

## Usage
0.- Download and set up properly packer.
1.- Fill the variable template file with your data.
2.- Run `packer build -var-file private_var.json template.json`
3.- Go and have fun...

## What it does?
1. Basic tooling
    - scripts/basic_tools.sh: Installs basic tools for work, run and debug any system.
    - script/epel_rhel.sh : Setup epel repository [link](https://fedoraproject.org/wiki/EPEL)
    - scripts/ansible.sh: Install and update pip and ansible [link](https://www.ansible.com/overview/how-ansible-works)

2. User creation
    - Creates and set password for a new user
    - Enable new user into sudoes with no password 
    - Set up public ssh key access with `~/.ssh/authorized_keys`
    - Secure root account with a random password
3.  sshd configuration
    - Secure sshd service, by disable root access, enable public key authentication, and change sshd port plus semanage configuration for new port 


---
# TODO
- Setup iptables
- Setup fail2ban -> [link](https://www.fail2ban.org/wiki/index.php/Main_Page)
- Setup logwatch 
