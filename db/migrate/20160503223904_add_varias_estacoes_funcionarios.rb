class AddVariasEstacoesFuncionarios < ActiveRecord::Migration
  def change
     add_column :funcionarios, :customPossuiVariasEstacoes, :boolean
  end
end
