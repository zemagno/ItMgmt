class CreateInventarioKpmgSws < ActiveRecord::Migration
  def change
    create_table :inventario_kpmg_sws do |t|
      t.string :ip, :limit => 20
      t.string :sw, :limit => 100
      t.string :versao1, :limit => 20
      t.string :versao2, :limit => 20
      t.string :fabricante, :limit => 50
      t.date :data

      t.timestamps
    end
  end
end
