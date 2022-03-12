<p align="center">
<img src="https://cloud.githubusercontent.com/assets/5732642/23307327/5d617df2-faa7-11e6-8534-266a2a7f365c.png" alt="ansible" style="max-width:100%;">
</p>

# Ansible configuration
Ansible is used to provision servers or in my case the many raspberry pis I occasionally use at home. They will have different roles or applications but will have the same basic configuration. It's nice to try out something new like Ansible. Prerequisits is that ansible is [installed](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html#installing-ansible-with-pip). 

# Let's start
First of all you'll need a base image installed on an SD card. Next add a `ssh` file to the boot partition, this will ensure we can ssh into the raspberry pi. And don't forget you'll need [wifi](https://www.raspberrypi.org/documentation/configuration/wireless/headless.md) or an ethernet cable.

The first part is creating users, this has to be done by the default user. So the first role has to be executed by the `pi` user first. There are two options use `--ask-pass` to request for the password or manually add your public ssh key to the authorized keys of the `pi` user for the first bit. Don't forget to change [/roles/users/vars/main.yml](/martijncasteel/ansible/blob/main/roles/users/vars/main.yml).

After adding your own user, the rest of the playbook can be executed.

```shell
# copy your ssh key to the pi user
ssh-copy-id pi@raspberrypi.local

# run first bit with default pi user
ansible-playbook main.yml --tags='initial-setup' -u pi

# run entire playbook as your own
ansible-playbook main.yml
```

