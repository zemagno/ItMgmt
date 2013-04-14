class AddFornecedorToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :fornecedor_id, :integer
  end
end
