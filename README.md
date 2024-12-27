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


