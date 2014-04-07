class CreateHerancaChecklists < ActiveRecord::Migration
  def change
    create_table :heranca_checklists do |t|
      t.integer :pai_id
      t.integer :filho_id

      t.timestamps
    end
  end
end
