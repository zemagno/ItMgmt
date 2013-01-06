class AddAnotacoesToFornecedores < ActiveRecord::Migration
  def self.up
    add_column :fornecedores, :anotacoes, :text
  end

  def self.down
    remove_column :fornecedores, :anotacoes
  end
end
