SELECT hostname,software
FROM inventario_sws
INTO OUTFILE '/Users/zemagno/Dropbox/dev/ror/ItMgmt/CargaInventarios/inventario_sws.csv'
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n';

SELECT ip,sw
FROM inventario_kpmg_sws
INTO OUTFILE '/Users/zemagno/Dropbox/dev/ror/ItMgmt/CargaInventarios/inventario_kpmg_sws.csv'
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n';

SELECT ip,hostname
FROM inventario_hostnames
INTO OUTFILE '/Users/zemagno/Dropbox/dev/ror/ItMgmt/CargaInventarios/inventario_hostnames.csv'
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n';


SELECT ip,userid
FROM inventario_kpmg_userids
INTO OUTFILE '/Users/zemagno/Dropbox/dev/ror/ItMgmt/CargaInventarios/inventario_kpmg_userids.csv'
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n';
