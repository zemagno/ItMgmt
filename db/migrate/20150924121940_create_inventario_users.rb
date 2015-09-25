class CreateInventarioUsers < ActiveRecord::Migration
  def change
    create_table :inventario_users do |t|
      t.string :hostname
      t.string :login

      t.timestamps
    end
  end
end
