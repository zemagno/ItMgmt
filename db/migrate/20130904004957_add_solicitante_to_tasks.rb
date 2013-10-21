class AddSolicitanteToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :solicitante, :string
  end
end
