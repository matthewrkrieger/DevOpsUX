pv -cN gzip-read -w 80 < backup.sql.gz \
| gunzip | pv -w 80 -cN mysql-write \
| mysql -h 127.0.0.1 -u stage_restore -psomethingSecure staging_db
