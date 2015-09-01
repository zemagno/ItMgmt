class AddIndex2ToInventarioKpmgSw < ActiveRecord::Migration
  def change
  	add_index :inventario_kpmg_sws, [:ip,:sw]
  end
end
