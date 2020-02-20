We are using flyway to create db schema and migrations, After creating migration script, Use following command to apply
your migration.

```mvn clean flyway:migrate -Dflyway.configFile=flyway.properties```

