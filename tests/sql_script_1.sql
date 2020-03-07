CREATE USER {{ sql_test_1_username }} WITH ENCRYPTED PASSWORD '{{ sql_test_1_password }}';
CREATE DATABASE {{ sql_test_1_database_name }};
GRANT ALL PRIVILEGES ON DATABASE {{ sql_test_1_database_name }} TO {{ sql_test_1_username }};