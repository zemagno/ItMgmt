class FuncionarioSuspenso < ActiveRecord::Migration
  def change
 	add_column :funcionarios, :loginBloqueado, :boolean
  	add_column :funcionarios, :justificativaLoginBloqueado, :string
  end
end
