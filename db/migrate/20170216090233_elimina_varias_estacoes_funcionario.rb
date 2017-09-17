class EliminaVariasEstacoesFuncionario < ActiveRecord::Migration
  def self.down

    add_column :funcionarios, :customPossuiVariasEstacoes, :boolean
  end

  def self.up
  	begin
      execute %Q{ drop view if exists viewrelatusuariocomvariasestacoes ; }
    rescue
    end
    begin
      remove_column :funcionarios, :customPossuiVariasEstacoes
    rescue
    ebd
  	# execute %Q{ create view viewrelatusuariocomvariasestacoes as 
  	# 	        select 
  	# 				notificacao AS Usuario,
  	# 				group_concat(left(descricao,20),'(',sites.nome,')' separator ' - ') AS Estacoes,
  	# 				funcionarios.NomEstadoLocalTrabalho AS Estado 
 		# 		from (
   #  					sites join (
   #  					cis left join funcionarios on(
   #     										(notificacao = funcionarios.Login))))
  	# 			where 
			# 	     ((tipoci_id = 46) and 
			# 	      (statusci_id = 1) and 
			# 	      (sites.id = site_id))
 		# 		group by notificacao 
 		# 		having (count(0) > 1)
  	# 			}
    end
end
