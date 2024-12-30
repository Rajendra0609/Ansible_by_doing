Here are some advanced Ansible tasks and exercises that can help you deepen your knowledge and skills:

Task 1: Complex Playbooks with Roles
Objective: Write a complex playbook that uses roles to organize tasks.

Steps:

Create a directory structure for your roles.

Create roles for setting up a web server, database server, and a load balancer.

Use the roles in a playbook to deploy a complete web application stack.

Skills Practiced: Role creation, Playbook structuring, Modular design.


<<<<  ansible-playbook -i inventory.ini playbooks/deploy.yml -kK >>>>




Verify weather it was working or not.
curl -I http://192.168.0.194
########################################################################################################################################
Task 2: Ansible Vault
Objective: Secure sensitive information using Ansible Vault.

Steps:

Create a playbook that uses sensitive data like passwords or API keys.

Use Ansible Vault to encrypt the sensitive data.

Modify the playbook to decrypt and use the data securely.

Skills Practiced: Data encryption, Security best practices.


ansible-playbook deploy.yml --ask-vault-pass

ansible-vault edit secrets.yml
ansible-vault create secrets.yml


###########################################################################################################################################

Task 3: Dynamic Inventory
Objective: Use dynamic inventory to manage hosts.

Steps:

Create a script or use a plugin that fetches inventory data from a cloud provider (e.g., AWS, Azure).

Configure the playbook to use the dynamic inventory.

Deploy and manage cloud instances using the playbook.

Skills Practiced: Dynamic inventory, Cloud integration.


export ANSIBLE_LIBRARY=$PWD


sudo journalctl | grep 'useradd'  ---> we can verify it.
