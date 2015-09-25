class CreateInventarioSws < ActiveRecord::Migration
  def change
    create_table :inventario_sws do |t|
      t.string :hostname
      t.string :software

      t.timestamps
    end
  end
end
