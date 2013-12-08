class CreateChecklists < ActiveRecord::Migration
  def change
    create_table :checklists do |t|
      t.string :descricao
      t.string :user
      t.references :tipoci

      t.timestamps
    end
    add_index :checklists, :tipoci_id
  end
end
