class CreateExecItensChecklists < ActiveRecord::Migration
  def change
    create_table :exec_itens_checklists do |t|
      t.string :gmud
      t.string :descricao
      t.string :users
      t.string :cis
      t.references :exechecklist
      t.references :statuschecklist

      t.timestamps
    end
    add_index :exec_itens_checklists, :exechecklist_id
    add_index :exec_itens_checklists, :statuschecklist_id
  end
end
