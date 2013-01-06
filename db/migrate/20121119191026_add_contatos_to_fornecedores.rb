class AddContatosToFornecedores < ActiveRecord::Migration
  def self.up
    add_column :fornecedores, :contatos, :text
  end

  def self.down
    remove_column :fornecedores, :contatos
  end
end
