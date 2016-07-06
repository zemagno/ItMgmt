Versao=$(date '+%Y%m%d_%H%M')
mysqldump -u root tasklist_development > dumpItMgmt$Versao.sql


scp root@10.2.17.117:/home/mysql/backup/dumpItMgmt.sql .
scp root@10.2.17.117:/home/mysql/backup/dumpInventario.sql .


mysql -u root tasklist_development < dumpItMgmt.sql
mysql -u root inventario < dumpInventario.sql

rm dumpItMgmt.sql
rm dumpInventario.sql
bundle exec rake ts:reindex