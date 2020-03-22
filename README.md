Run Postgres DB
=========

Runs a Postgres database using docker-compose.

Requirements
------------

Only tested on Ubuntu 18.04 machines.

We suggest encrypting the variables file using `ansible-vault`.

Role Variables
--------------

| Variable | Type | Default | Comments | 
| -------- | ---- | ------- | -------- |
| `external_network` | String | | External docker network. Useful to connect the DB to other containers connected to that docker network. |
| `postgres_admin_password` | String | `postgrespass` | PostgreSQL admin password. |
| `postgres_admin_username` | String | `postgres` | PostgreSQL admin username. |
| `postgres_database` | String | `postgres` | Default PostgreSQL database. |
| `postgres_expose_port` | Boolean | `False` | PostgreSQL exposed port. |
| `postgres_hostname` | String | `postgres` | PostgreSQL container hostname. |
| `postgres_image` | String | `postgres:10` | PostgreSQL docker image. |
| `postgres_port` | Number | `5432` | PostgreSQL exposed port. Only used when `postgres_expose_port` is set to true. |
| `postgres_version` | String | `10` | PostgreSQL version. |
| `postgres_volume` | String | `postgres_data` | Name of the postgres container volume. |
| `project_dir` | String | `/etc/docker/compose` | Project directory where the `docker-compose.yml` file and other files will be stored. **Should be an absolute path**. |
| `remove_volumes` | Boolean | `False` | Flag that indicates if the volume related to the database container should be removed after destroying or updating the project. |
| `sql_scripts` | [String] | `[]` | List of SQL scripts to run when the database engine is run for the first time. |
| `state` | String | `present` | State of the project. If set to `present` the project will run the `docker-compose.yml` file. If set to `absent` it will stop all the containers and remove the `{{project_dir}}/postgres` folder from the server. |


Example Playbook
----------------

This role supports importing `sql` files that will be run when creating the DB for the first time. This file can be Jinja2 templates.

For example:

```sql
CREATE USER {{ example_username }} WITH ENCRYPTED PASSWORD '{{ example_password }}';
CREATE DATABASE {{ example_database }};
GRANT ALL PRIVILEGES ON DATABASE {{ example_database }} TO {{ example_username }};
```

Then run a `playbook` importing the `role`. The values for the `sql` templates variables are stored inside the `secrets.yaml` file, encrypted with `ansible-vault`.

```yaml
---
- hosts: server
  vars_files:
    - secrets.yaml
  roles:
      - run_postgres
```

License
-------

MIT
