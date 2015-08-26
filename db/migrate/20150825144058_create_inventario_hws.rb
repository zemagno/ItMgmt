class CreateInventarioHws < ActiveRecord::Migration
  def change
    create_table :inventario_hws do |t|
      t.string :hostname
      t.string :fabricante
      t.string :modelo
      t.string :numSerie
      t.string :processador
      t.string :memoria
      t.string :hd
      t.string :so
      t.string :userid
      t.date :dataUltimoLogin
      t.string :site

      t.timestamps
    end
  end
end
