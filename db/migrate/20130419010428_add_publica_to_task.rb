class AddPublicaToTask < ActiveRecord::Migration
  def change
    add_column :tasks, :publica, :boolean
  end
end
