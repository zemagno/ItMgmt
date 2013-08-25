class AddCiToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :ci_id, :integer
  end
end
