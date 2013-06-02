class AddTipotaskToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :tipotask, :string
  end
end
