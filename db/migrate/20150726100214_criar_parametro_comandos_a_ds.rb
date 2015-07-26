class CriarParametroComandosADs < ActiveRecord::Migration
  def up
  	execute %Q{ insert into parametros (tipo,subtipo,valor) values("ComandoAD","FuncDesligado","N/A"); }
    execute %Q{ insert into parametros (tipo,subtipo,valor) values("ComandoAD","MudancaIntExt","N/A"); }
    execute %Q{ insert into parametros (tipo,subtipo,valor) values("ComandoAD","MudancaLocal","N/A"); }
    execute %Q{ insert into parametros (tipo,subtipo,valor) values("ComandoAD","NovoFunc","N/A"); }
  end

  def down
  	execute %Q{ delete from  parametros where tipo = "ComandoAD" and subtipo = "FuncDesligado"; }
    execute %Q{ delete from  parametros where tipo = ""ComandoAD" and subtipo = "MudancaIntExt"; }
    execute %Q{ delete from  parametros where tipo = ""ComandoAD" and subtipo = "MudancaLocal"; }
    execute %Q{ delete from  parametros where tipo = ""ComandoAD" and subtipo = "NovoFunc"; }
  end
end
