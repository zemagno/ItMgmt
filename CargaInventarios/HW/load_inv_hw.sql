delete from inventario_hws;
LOAD DATA INFILE '/Users/zemagno/Dropbox/dev/ror/ItMgmt/CargaInventarios/HW/hw.output'
    REPLACE
    INTO TABLE inventario_hws 
    CHARACTER SET utf8
    FIELDS 
        TERMINATED BY ','
        ENCLOSED BY '"'
     (@Tipo,@Patrimonio,@hostname,@fabricante,@modelo,@numSerie,@processador,@memoria,@hd,@so,@nf,@dataCompra,@obs,@login,@dataUltimoLogin,@matricula,@solicitacao,@site)
    set hostname=@hostname,fabricante=@fabricante,modelo=@modelo,numSerie=@numSerie,processador=@processador,memoria=@memoria,hd=@hd,so=@so,login=@login,dataUltimoLogin=@dataUltimoLogin,site=@site
;

