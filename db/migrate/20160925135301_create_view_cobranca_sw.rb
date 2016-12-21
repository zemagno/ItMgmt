class CreateViewCobrancaSw < ActiveRecord::Migration
  def up
    execute %Q{ drop view if exists CobrancaMensalUsoSoftware }
    execute %Q{
      Create view CobrancaMensalUsoSoftware AS

      select
         cis.notificacao AS login,
         group_concat(cis.descricao separator ' | ') AS softwares,
         sum(cis.CustoMensal) AS customensal
      from
         cis
      where
	      ((cis.tipoci_id = 13) and
	       (cis.statusci_id = 1) and
	       (cis.tipoCobranca = 2))
      group by
	      cis.notificacao
    }

  end

  def down
    execute %Q{ drop view if exists CobrancaMensalUsoSoftware }
  end
end
