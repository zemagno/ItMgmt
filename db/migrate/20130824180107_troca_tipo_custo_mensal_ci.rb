class TrocaTipoCustoMensalCi < ActiveRecord::Migration
  def up
    remove_column :cis, :CustoMensal
  	add_column :cis, :CustoMensal, :decimal, :precision => 10, :scale => 2
  end

  def down
  end
end