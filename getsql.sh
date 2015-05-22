scp root@10.2.17.117:/home/mysql/backup/dumpItMgmt.sql .
mysql -u root tasklist_development < dumpItMgmt.sql
rm dumpItMgmt.sql
take ts:reindex