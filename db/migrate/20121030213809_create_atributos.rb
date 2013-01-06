class CreateAtributos < ActiveRecord::Migration
  def self.up
    create_table :atributos do |t|
      t.references :ci
      t.references :dicdado
      t.string :valor

      t.timestamps
    end
  end

  def self.down
    drop_table :atributos
  end
end
