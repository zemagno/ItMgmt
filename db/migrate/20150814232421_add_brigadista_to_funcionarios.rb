class AddBrigadistaToFuncionarios < ActiveRecord::Migration
  def change
    add_column :funcionarios, :brigadista, :boolean
  end
end
