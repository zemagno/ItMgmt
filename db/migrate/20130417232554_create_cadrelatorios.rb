class CreateCadrelatorios < ActiveRecord::Migration
  def change
    create_table :cadrelatorios do |t|
      t.string :nome
      t.text :consulta

      t.timestamps
    end
  end
end
