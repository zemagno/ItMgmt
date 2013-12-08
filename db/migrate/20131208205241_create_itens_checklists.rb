class CreateItensChecklists < ActiveRecord::Migration
  def change
    create_table :itens_checklists do |t|
      t.references :Checklist
      t.string :descricao
      t.references :user
      t.references :ci

      t.timestamps
    end
    add_index :itens_checklists, :Checklist_id
    add_index :itens_checklists, :user_id
    add_index :itens_checklists, :ci_id
  end
end
