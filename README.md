<p align="center">
<img src="https://cloud.githubusercontent.com/assets/5732642/23307327/5d617df2-faa7-11e6-8534-266a2a7f365c.png" alt="ansible" style="max-width:100%;">
</p>

# Ansible configuration
Ansible is used to provision servers or in my case the many raspberry pis I occasionally use at home. They will have different roles or applications but will have the same basic configuration. It's nice to try out something new like Ansible. Prerequisits is that ansible is [installed](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html#installing-ansible-with-pip). 

# Let's start
Don't forget to change [/roles/users/vars/main.yml](/martijncasteel/ansible/blob/main/roles/users/vars/main.yml).

After adding your own user, the playbook can be executed further. Optionally with specific parts or skipping parts, see [main.yml](main.yml) for some roles.

```shell
# create your own user
ansible-playbook main.yml -u root --tags users

# run entire playbook as your own
ansible-playbook main.yml 

# optionally skip certbot to prevent many retries
ansible-playbook --tags apps --skip-tags certbot
```

