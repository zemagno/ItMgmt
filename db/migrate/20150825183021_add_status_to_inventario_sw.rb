class AddStatusToInventarioSw < ActiveRecord::Migration
  def change
    add_column :inventario_sws, :status, :integer
  end
end
