class AddVersionamentoInventario < ActiveRecord::Migration
  def change
    add_column :inventario_sws, :versao, :integer, default: 0
    add_column :inventario_users, :versao, :integer, default: 0
    execute %Q{ update inventario_sws set versao=0; }
    execute %Q{ update inventario_users set versao=0; }
  end
end
