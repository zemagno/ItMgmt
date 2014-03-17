class CreateExecItensChecklists < ActiveRecord::Migration
  def change
    create_table :exec_itens_checklists do |t|
      t.string :descricao
      t.string :users
      t.string :cis
      t.references :exec_checklist
      t.references :status_checklist

      t.timestamps
    end
  end
end
