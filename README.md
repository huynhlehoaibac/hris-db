# Getting Started

### Liquibase
##### create tag
```console
➜  mvn liquibase:tag -Dliquibase.tag=1.0 -Denv=dev
```

##### apply changesets
```console
➜  mvn liquibase:update -Dliquibase.changeLogFile=db/changelog/dev/db.changelog-1.0.sql -Denv=dev
```

##### create tag
```console
➜  mvn liquibase:tag -Dliquibase.tag=1.1 -Denv=dev
```

##### apply changesets
```console
➜  mvn liquibase:update -Dliquibase.changeLogFile=db/changelog/dev/db.changelog-1.1.sql -Denv=dev
```

##### rollback changesets
```console
➜  mvn liquibase:rollback -Dliquibase.changeLogFile=db/changelog/dev/db.changelog-1.1.sql -Dliquibase.rollbackTag=1.1 -Denv=local
```

