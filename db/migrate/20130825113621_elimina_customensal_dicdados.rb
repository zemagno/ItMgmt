class EliminaCustomensalDicdados < ActiveRecord::Migration
  def up
  	execute <<-SQL
	         delete from atributos where dicdado_id = 63
	    SQL
	    execute <<-SQL
	         delete from dicdados where id = 63
	    SQL
  end

  def down
  end
end
