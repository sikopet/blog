Variables
---------

In inventory file

* ok if you don't have too many hosts
* only Booleans and strings (not lists and dictionaries)

In `host_vars/nginx01.example.org`, `group_vars/production`

* separate file for each host or group

```
$ cat group_vars/production
db_primary_host: buda.example.org
# accessed as {{ db_primary_host }}

$ cat_group_vars/production_dict
db:
  primary:
    host: buda.example.org
# accessed as {{ db.primary.host }}
```

Roles
-----

Primary mechanism for breaking a playbook into multiple files
* tasks
* files
* templates
* handlers
* vars (higher priority than those defined in the `vars` section of a play)
* defaults (default variables that can be everridden)
* meta (dependency info about a role)

If you think you might want to change the value of a variable in a role (via `vars` section of a play or role's arguments), use a default variable (`defaults`). If you don't want it to change, use a regular variable (`vars`).

Roles with variables:
```
- name: deploy postgres on vagrant
  hosts: db
  vars_files:
    - secrets.yml
  roles:
    - role: database
      database_name: "{{ mezzanine_proj_name }}"
      database_user: "{{ mezzanine_proj_name }}"

- name: deploy mezzanine on vagrant
  hosts: web
  vars_files:
    - secrets.yml
  roles:
    - role: mezzanine
      database_host: "{{ hostvars.db.ansible_eth1.ipv4.address }}"
      live_hostname: 192.168.33.10.xip.io
      domains:
        - 192.168.33.10.xip.io
        - www.192.168.33.10.xip.io
```

See [roles](https://github.com/ansiblebook/ansiblebook/tree/master/roles/playbooks/roles) for more.

Source
------

* [Ansible: Up and Running](https://github.com/ansiblebook/ansiblebook) (2017)
