# dbt Workshop

Based on the dbt own [jaffle shop demo](https://github.com/dbt-labs/jaffle_shop)

## Requirement

In order to run the dbt workshop we need a database. To keep things light, we use [duckdb](https://duckdb.org/). See https://duckdb.org/#quickinstall on how to install

duckdb is an in-memory database, similar to sqllite, but for analytics. The database containing the data is provided as file, in this the [dbt_workshop.duckdb](dbt_workshop.duckdb) in the root of the repository.
### dbt

A working installation of [dbt](https://docs.getdbt.com/docs/get-started/installation).
Check with

```bash
dbt --version
installed version: 1.10.13
   latest version: 1.10.13

Up to date!

Plugins:
  - duckdb: 1.9.4```
```

Make sure you also installed the
required [adapter for you database](https://docs.getdbt.com/docs/supported-data-platforms). Here dbt-duckdb is needed

The DB connection has to be setup in a `profiles.yml` file which can be generated using the
provided [profiles_template.yml](profiles_template.yml). We provide examples for a bigquery and a postgres connection.

### dbt plugins

We use several dbt plugins defined in the [packages.yml](packages.yml). To install those dependencies run:

```
dbt deps
```

### Further python packages

Beside `dbt` we optionally use further python packages in the workshop, e.g. `elementary-data`, `pre-commit` and `sql-fluff`. The
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
