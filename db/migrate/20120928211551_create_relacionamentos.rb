class CreateRelacionamentos < ActiveRecord::Migration
  def self.up
    create_table :relacionamentos do |t|
      t.integer :impactado_id
      t.integer :dependente_id

      t.timestamps
    end
  end

  def self.down
    drop_table :relacionamentos
  end
end
