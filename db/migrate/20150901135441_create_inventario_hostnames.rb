class CreateInventarioHostnames < ActiveRecord::Migration
  def up
    create_table :inventario_hostnames do |t|
      t.string :hostname
      t.string :ip

      t.timestamps
    end
    add_index :inventario_hostnames, :hostname
  end
  def down
  	
  end
end
