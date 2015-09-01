class AddContadorToInventarioKpmgUserid < ActiveRecord::Migration
  def change
    add_column :inventario_kpmg_userids, :contador, :integer, :default => 0
  end
end
