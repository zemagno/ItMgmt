class FuncionarioAfastado < ActiveRecord::Migration
  def change
     add_column :funcionarios, :DataInicioAfastamento, :datetime
     add_column :funcionarios, :DataFinalAfastamento,  :datetime
  end
end
