#!/usr/bin/python

from ansible.module_utils.basic import AnsibleModule
import json
import subprocess

def manage_user(action, username, attributes):
    if action == 'create':
        # Create user command
        cmd = ['useradd', username]
        for key, value in attributes.items():
            cmd.append(f'--{key}={value}')
        subprocess.run(cmd, check=True)
        return f"User  {username} created."

    elif action == 'update':
        # Update user command
        cmd = ['usermod', username]
        for key, value in attributes.items():
            cmd.append(f'--{key}={value}')
        subprocess.run(cmd, check=True)
        return f"User  {username} updated."

    elif action == 'delete':
        # Delete user command
        subprocess.run(['userdel', username], check=True)
        return f"User  {username} deleted."

    return "Invalid action."

def run_module():
    module_args = dict(
        action=dict(type='str', required=True, choices=['create', 'update', 'delete']),
        username=dict(type='str', required=True),
        attributes=dict(type='dict', required=False, default={})
    )

    result = dict(
        changed=False,
        message=''
    )

    # Create the Ansible module
    module = AnsibleModule(argument_spec=module_args, supports_check_mode=True)

    action = module.params['action']
    username = module.params['username']
    attributes = module.params['attributes']

    try:
        message = manage_user(action, username, attributes)
        result['changed'] = True
        result['message'] = message
    except Exception as e:
        module.fail_json(msg=str(e))

    module.exit_json(**result)

if __name__ == '__main__':
    run_module()
