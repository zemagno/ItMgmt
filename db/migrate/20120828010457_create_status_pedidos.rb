class CreateStatusPedidos < ActiveRecord::Migration
  def self.up
    create_table :status_pedidos do |t|
      t.string :status

      t.timestamps
    end
  end

  def self.down
    drop_table :status_pedidos
  end
end
