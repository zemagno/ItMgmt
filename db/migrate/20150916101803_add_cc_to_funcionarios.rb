class AddCcToFuncionarios < ActiveRecord::Migration
  def change
    add_column :funcionarios, :DscCentroCustoBU, :string, :limit => 30
    add_column :funcionarios, :DscCentroCustoExecutivo, :string, :limit => 50
    add_column :funcionarios, :IdtCentroCustoBU, :string, :limit => 30
    add_column :funcionarios, :IdtCentroCustoExecutivo, :string, :limit => 30
    add_column :funcionarios, :NomEmailPessoal, :string, :limit => 50
  end
end
