class ChangeContatosInFornecedores < ActiveRecord::Migration
  def up
  	change_column :fornecedores, :contatos, :text
  	
  end

  def down
  end
end
