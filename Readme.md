### Setup MySql database

First Create db schema with `think4good` name in your mysql server. Update `flyway.properties` with server
credentials.

We are using [flyway](https://flywaydb.org/) to create db schema and migrations, Migration is just a `.sql` file which is required to add
in `db/migrations` path.

```mvn clean flyway:migrate -Dflyway.configFile=flyway.properties```

