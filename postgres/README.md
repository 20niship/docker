
# Postgres

`psql`からアクセスする
```sh
psql -h localhost -p 5432 -U docker -d sample

```

NextjsでPRISMAを使う場合
DATABASE_URL=postgresql://docker:pass@localhost:5432/sample
