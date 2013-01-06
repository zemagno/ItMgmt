class AddEnderecosToFornecedores < ActiveRecord::Migration
  def self.up
    add_column :fornecedores, :enderecos, :text
  end

  def self.down
    remove_column :fornecedores, :enderecos
  end
end
