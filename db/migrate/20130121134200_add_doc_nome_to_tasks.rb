class AddDocNomeToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :nome, :string
  end
end
