FROM ghcr.io/dbt-labs/dbt-duckdb:1.9.4

RUN pip install elementary-data==0.19.0

WORKDIR /usr/app
COPY . .
# profiles.yml must be created, can be filled with references to environment variables.
# Pass those env vars to the container when started
# See https://docs.getdbt.com/reference/dbt-jinja-functions/env_var
COPY profiles.yml
RUN ["dbt","deps"]
ENTRYPOINT ["dbt"]
