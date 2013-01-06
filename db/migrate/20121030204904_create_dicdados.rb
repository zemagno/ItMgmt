class CreateDicdados < ActiveRecord::Migration
  def self.up
    create_table :dicdados do |t|
      t.string :nome
      t.references :tipoci

      t.timestamps
    end
  end

  def self.down
    drop_table :dicdados
  end
end
