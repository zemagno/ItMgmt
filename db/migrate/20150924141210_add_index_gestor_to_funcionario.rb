class AddIndexGestorToFuncionario < ActiveRecord::Migration
  def change
  	add_index :funcionarios, [:NomEmailGestorProfissional], unique: false
  end
end
