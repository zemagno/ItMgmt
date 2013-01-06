class CreateParametros < ActiveRecord::Migration
  def self.up
    create_table :parametros do |t|
      t.string :tipo
      t.string :subtipo
      t.string :valor

      t.timestamps
    end
  end

  def self.down
    drop_table :parametros
  end
end
