class CreateItensChecklists < ActiveRecord::Migration
  def self.up
    create_table :itens_checklists do |t|
      t.integer :checklist_id
      t.string :item

      t.timestamps
    end
  end

  def self.down
    drop_table :itens_checklists
  end
end
