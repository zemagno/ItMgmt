class ChangeValorInParametros < ActiveRecord::Migration
  def up
  	change_column :parametros, :valor, :text
  end
  def down
  end
end
