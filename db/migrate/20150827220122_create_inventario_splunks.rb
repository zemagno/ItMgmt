class CreateInventarioSplunks < ActiveRecord::Migration
  def change
    create_table :inventario_splunks_userids do |t|
      t.string :ip, :limit => 20
      t.string :userid, :limit => 50
      t.integer :contador

      t.timestamps
    end
    add_index :inventario_splunks_userids, [:ip,:userid]
  
  end
end
