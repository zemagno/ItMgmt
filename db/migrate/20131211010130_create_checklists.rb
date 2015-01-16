class CreateChecklists < ActiveRecord::Migration
  def change
    create_table :checklists do |t|
      t.text :descricao
      t.string :users
      t.references :tipoci

      t.timestamps
    end
    add_index :checklists, :tipoci_id
  end
end
