class AddAtivoToTasks < ActiveRecord::Migration
  def self.up
    add_column :tasks, :Ativo, :boolean
  end

  def self.down
    remove_column :tasks, :Ativo
  end
end
