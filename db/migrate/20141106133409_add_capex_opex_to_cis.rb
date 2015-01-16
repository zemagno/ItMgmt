class AddCapexOpexToCis < ActiveRecord::Migration
  def change
    add_column :cis, :CustoMensalCapex, :decimal, :precision => 10, :scale => 2
    add_column :cis, :CustoMensalOpex,  :decimal, :precision => 10, :scale => 2
  end
end
