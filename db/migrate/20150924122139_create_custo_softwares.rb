class CreateCustoSoftwares < ActiveRecord::Migration
  def change
    create_table :custo_softwares do |t|
      t.string :software
      t.string :fabricante
      t.decimal :custoMensal

      t.timestamps
    end
  end
end
