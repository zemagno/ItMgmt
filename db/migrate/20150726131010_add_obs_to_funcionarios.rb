class AddObsToFuncionarios < ActiveRecord::Migration
  def change
    add_column :funcionarios, :observacao, :string
    add_column :funcionarios, :semEstacao, :boolean
  end
end
