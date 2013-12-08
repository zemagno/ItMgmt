class CreateExecItensChecklists < ActiveRecord::Migration
  def change
    create_table :exec_itens_checklists do |t|
      t.string :gmud
      t.string :descricao
      t.string :user
      t.references :ci
      t.references :ExecChecklist
      t.references :StatusChecklist

      t.timestamps
    end
    add_index :exec_itens_checklists, :ci_id
    add_index :exec_itens_checklists, :ExecChecklist_id
    add_index :exec_itens_checklists, :StatusChecklist_id
  end
end
