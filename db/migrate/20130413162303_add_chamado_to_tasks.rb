class AddChamadoToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :chamado, :string
  end
end
