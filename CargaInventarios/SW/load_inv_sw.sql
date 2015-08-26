delete from inventario_sws;
LOAD DATA INFILE '/Users/zemagno/Dropbox/dev/ror/ItMgmt/CargaInventarios/SW/sccm2.output'
    REPLACE
    INTO TABLE inventario_sws 
    CHARACTER SET utf8
    FIELDS TERMINATED BY ','
     (@hostname,@software)
    set hostname=@hostname,software=@software;
