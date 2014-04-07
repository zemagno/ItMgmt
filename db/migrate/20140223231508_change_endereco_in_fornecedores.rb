class ChangeEnderecoInFornecedores < ActiveRecord::Migration
  def up
  	change_column :fornecedores, :endereco, :text
  end

  def down
  end
end
