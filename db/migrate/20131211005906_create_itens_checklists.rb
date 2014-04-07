class CreateItensChecklists < ActiveRecord::Migration
  def change
    create_table :itens_checklists do |t|
      t.references :checklist
      t.string :descricao
      t.string :users
      t.string :cis

      t.timestamps
    end
    add_index :itens_checklists, :checklist_id
  end
end
