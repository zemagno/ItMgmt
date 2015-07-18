class AddNomAlocacaoToFuncionarios < ActiveRecord::Migration
  def change
    add_column :funcionarios, :NomAlocacao, :string
  end
end
