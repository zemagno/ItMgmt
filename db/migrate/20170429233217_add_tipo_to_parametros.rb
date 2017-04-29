class AddTipoToParametros < ActiveRecord::Migration
  def change
    add_column :parametros, :tipoValor, :integer
  end
end
