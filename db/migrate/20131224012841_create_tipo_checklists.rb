class CreateTipoChecklists < ActiveRecord::Migration
  def change
    create_table :tipo_checklists do |t|
      t.string :tipo

      t.timestamps
    end
  end
end
