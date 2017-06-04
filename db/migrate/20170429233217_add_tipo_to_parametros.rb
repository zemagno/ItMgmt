class AddTipoToParametros < ActiveRecord::Migration
  def change
    add_column :parametros, :tipoValor, :integer
    execute %Q{ update parametros set tipoValor=0 ; }
  end
end
