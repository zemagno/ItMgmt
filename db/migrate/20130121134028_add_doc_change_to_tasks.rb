class AddDocChangeToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :DocChange, :string
  end
end
