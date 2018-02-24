#!/bin/bash

adduser $DO_USER
echo "$DO_USER_PASSWD" | passwd $DO_USER --stdin
echo "%$DO_USER ALL=(ALL) NOPASSWD: ALL" >> "/etc/sudoers.d/$DO_USER"

su -l $DO_USER -c "mkdir ~/.ssh"
su -l $DO_USER -c "chmod 700 ~/.ssh"
su -l $DO_USER -c "cp /tmp/key.pub ~/.ssh/authorized_keys"
su -l $DO_USER -c "chmod 600 ~/.ssh/authorized_keys"

#secure root account
echo "root:$(< /dev/urandom tr -dc A-Za-z0-9 | head -c16)$(openssl rand -base64 16)$(date +%s | sha256sum | base64 | head -c 16)"| chpasswd &> /dev/null

