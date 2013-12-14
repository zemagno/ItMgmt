class CreateExecChecklists < ActiveRecord::Migration
  def change
    create_table :exec_checklists do |t|
      t.string :gmud
      t.string :descricao
      t.string :cis
      t.string :users
      t.date :inicioexec
      t.date :fimexec
      t.references :tipoci

      t.timestamps
    end
    add_index :exec_checklists, :tipoci_id
  end
end
