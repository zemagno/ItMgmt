class CreateInventarioSws < ActiveRecord::Migration
  def change
    create_table :inventario_sws, :options => 'COLLATE=utf8_unicode_ci' do |t|
      t.string :hostname
      t.string :software

      t.timestamps
    end
    execute %Q{ alter table inventario_sws CHARSET=utf8 COLLATE=utf8_unicode_ci; }
  end
end
