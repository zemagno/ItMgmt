class CreateInventarioKpmgUserids < ActiveRecord::Migration
  def change
    create_table :inventario_kpmg_userids do |t|
      t.string :ip, :limit => 20
      t.string :userid, :limit => 50

      t.timestamps
    end
  end
end
