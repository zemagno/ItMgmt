class AddCustomToFuncionarios < ActiveRecord::Migration
  def change
    add_column :funcionarios, :cipa, :boolean
   
  end
end
