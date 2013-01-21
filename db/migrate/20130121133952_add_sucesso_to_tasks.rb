class AddSucessoToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :sucesso, :boolean
  end
end
