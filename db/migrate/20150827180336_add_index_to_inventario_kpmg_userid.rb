class AddIndexToInventarioKpmgUserid < ActiveRecord::Migration
  def change
  	add_index :inventario_kpmg_userids, [:ip,:userid]
  end
end
