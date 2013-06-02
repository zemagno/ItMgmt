class AddDescricaorestritaToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :Descricaorestrita, :text
  end
end
