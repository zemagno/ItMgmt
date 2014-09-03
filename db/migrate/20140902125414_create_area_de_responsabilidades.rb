class CreateAreaDeResponsabilidades < ActiveRecord::Migration
  def change
    create_table :area_de_responsabilidades do |t|
      t.string :area
      t.string :responsaveis

      t.timestamps
    end
  end
end
