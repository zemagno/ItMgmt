class AddContratoToCis < ActiveRecord::Migration
  def up
    add_column :cis, :contrato_id, :integer

   
	    execute <<-SQL
	         update cis 
	             set contrato_id = ( select valor from atributos where dicdado_id = 5 and valor > 1 and cis.id = ci_id)
	    SQL
	    execute <<-SQL
	         delete from atributos where dicdado_id = 5
	    SQL
	    execute <<-SQL
	         delete from dicdados where id = 5
	    SQL
      
    
  end
end