class AddSourceToInventarioSw < ActiveRecord::Migration
  def change
  	add_column :inventario_sws, :srcSccm, :string, :limit => 5
  	add_column :inventario_sws, :srcScript, :string, :limit => 5
  	add_column :inventario_sws, :srcAuditor, :string, :limit => 5
  	add_column :inventario_sws, :total, :integer
  end
end
