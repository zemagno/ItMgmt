class AddIndexInventario01 < ActiveRecord::Migration
  def change
  	add_index :inventario_sws, [:hostname], unique: false
  	add_index :inventario_users, [:hostname], unique: false
  	add_index :inventario_users, [:login], unique: false

  end
end
