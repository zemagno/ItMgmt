class AcertaCustoMensalCi < ActiveRecord::Migration
 
  def up
  	    execute <<-SQL
	         update cis set CustoMensal = (select cast(replace(replace(replace(valor,"R$",""),".",""),",",".") as decimal(10,2)) from atributos where dicdado_id =63  and cis.id = ci_id)
	    SQL
  end

  def down
  end
end
