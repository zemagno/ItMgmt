class AddAreafornecedorToFornecedores < ActiveRecord::Migration
  def self.up
    add_column :fornecedores, :areafornecedor_id, :integer
  end

  def self.down
    remove_column :fornecedores, :areafornecedor_id
  end
end
