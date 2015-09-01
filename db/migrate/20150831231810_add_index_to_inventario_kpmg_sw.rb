class AddIndexToInventarioKpmgSw < ActiveRecord::Migration
  def change
  	add_index :inventario_kpmg_sws, :ip
  end
end
