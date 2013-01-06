class CreatePadraoChecklists < ActiveRecord::Migration
  def self.up
    create_table :padrao_checklists do |t|
      t.string :nome
      t.text :itens

      t.timestamps
    end
  end

  def self.down
    drop_table :padrao_checklists
  end
end
