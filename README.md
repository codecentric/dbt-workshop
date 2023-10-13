# dbt Workshop

Based on the dbt own [jaffle shop demo](https://github.com/dbt-labs/jaffle_shop)

## Requirement

In order to run the dbt demo we require a SQL DB/Warehouse that is supported by dbt (e.g. BigQuery, Postgres, Snowflake)

### Run your own Postgres

```
docker run --name some-postgres -e POSTGRES_PASSWORD=<secret> -e POSTGRES_USER=<user> -p 5432:5432 postgres
```

Moreover, the demo expects two tables `raw.raw_customers`, `raw.raw_orders` and `raw.raw_payments` in the database.
These tables can be filled with data using the provided `.csv` files in the [sample_data](sample_data) folder.

### Workshops run by codecentric

We usually provide a cloud hosted SQL database instance for the workshop participants, e.g. Google BigQuery. We will
provide the necessary credentials in the workshop.

### dbt

A working installation of [dbt](https://docs.getdbt.com/docs/get-started/installation).
Check with

```bash
dbt --version
installed version: 1.6.2
   latest version: 1.6.2

Up to date!

Plugins:
  - postgres: 1.6.2```
```

Make sure you also installed the
required [adapter for you database](https://docs.getdbt.com/docs/supported-data-platforms)
e.g. dbt-postgres or dbt-bigquery

The DB connection has to be setup in a `profiles.yml` file which can be generated using the
provided [profiles_template.yml](profiles_template.yml). We provide examples for a bigquery and a postgres connection.

### dbt plugins

We use several dbt plugins defined in the [packages.yml](packages.yml). To install those dependencies run:

```
dbt deps
```

### Further python packages

Beside `dbt` we use further python packages in the workshop, e.g. `elementary-data`, `data-diff`, `pre-commit` and `sql-fluff`. The
easiest way to install those packages is to use [poetry](https://python-poetry.org/) and use the
provided `pyproject.toml`. But every other way (pipenv, pip + virtualenv, ...) to install pip packages will also work.

## Using the starter project

Try running the following commands:

- dbt seed
- dbt snapshot
- dbt run
- dbt test

### Resources:

- Learn more about dbt [in the docs](https://docs.getdbt.com/docs/introduction)
