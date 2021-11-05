# Convert a database from Sybase Adaptive Server Anywhere 6 to PostgreSQL 9

## Running the PostgreSQL database with Docker

1. Ensure that you have Docker Compose > 1.25
2. Place your .dat files (the data to be copied into Postgres) in the `./unload` directory
3. Run `docker-compose up`

Once the database has been initialized, you can access the data through the command-line like this:

```
docker-compose exec db psql -U postgres
```

Before you run any queries on the database, make sure to set the right schema in `psql`:

```
postgres=# SET search_path TO tempdb;
```
