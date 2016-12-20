class FuncionarioSuspenso < ActiveRecord::Migration
  def change
  	add_column :funcionarios, :suspenso, :boolean
  end
end
