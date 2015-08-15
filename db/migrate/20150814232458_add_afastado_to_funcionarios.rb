class AddAfastadoToFuncionarios < ActiveRecord::Migration
  def change
    add_column :funcionarios, :afastado, :boolean
  end
end
