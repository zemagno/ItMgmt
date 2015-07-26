class AddRamalToFuncionarios < ActiveRecord::Migration
  def change
    add_column :funcionarios, :ramal, :string
  end
end
