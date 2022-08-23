<p align="center">
<img src="https://cloud.githubusercontent.com/assets/5732642/23307327/5d617df2-faa7-11e6-8534-266a2a7f365c.png" alt="ansible" style="max-width:100%;">
</p>

# Ansible configuration
Ansible is used to provision servers and in my case the main webserver I use. It's nice to try out something new like Ansible. And I couldn't upgrade my server for some reason and thought starting with a clean sheet! Prerequisit is that ansible is [installed](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html#installing-ansible-with-pip). 

# Let's start
Don't forget to change [/roles/users/vars/main.yml](/martijncasteel/ansible/blob/main/roles/users/vars/main.yml). Furthermore there is some hardcoded config in [apps/sites/](/martijncasteel/ansible/blob/main/roles/apps/sites). Furthermore the configuration in the [mail](/martijncasteel/ansible/blob/main/roles/mail/files) role is also hardcoded, maybe move this to _host_vars_ at some point! But trying to keep it simple at first!

After adding your own user, the playbook can be executed further. Optionally with specific parts or skipping parts, see [main.yml](main.yml) for some roles.

```shell
# create your own user
ansible-playbook main.yml -u root --tags users

# if you just want a basic server setup and already added your user above
ansible-playbook main.yml --tags common

# run entire playbook as your own
ansible-playbook main.yml

# optionally skip certbot to prevent many retries
ansible-playbook --tags apps --skip-tags certbot
```

