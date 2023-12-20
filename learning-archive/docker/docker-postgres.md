# accessing the postgresql container

1. `docker ps`

2. `docker exec -it <container_name or id>` bash

3. `psql -U <pg_user> -W` -U is for username -W is for password.

_note_: The default port is 5432. If you’re using another port, you’ll need to specify that with the `-p` flag

4. Then you're in you can use commands like `\l, \dt, \d, \c` to navigate around, `\q` to quit.

5. If youre to run sql commands remeber to end them with a semicolon(;)

6. By the way if youre working with a case-sensitive data object like a table name it best to enclose it in quotes(""). e.g. DROP TABLE IF EXISTS "User" CASCADE; i wasted an hour wondering what wrong with psql 😒.
