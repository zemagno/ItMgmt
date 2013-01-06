class CreateCis < ActiveRecord::Migration
  def self.up
    create_table :cis do |t|
      t.string :chave
      t.string :descricao
      t.references :site
      t.references :tipoci

      t.timestamps
    end
  end

  def self.down
    drop_table :cis
  end
end
