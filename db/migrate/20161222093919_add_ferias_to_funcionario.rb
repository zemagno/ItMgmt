class AddFeriasToFuncionario < ActiveRecord::Migration
  def change
  	add_column :funcionarios, :DataInicioFerias, :date
  	add_column :funcionarios, :DataFimFerias, :date
  end
end
