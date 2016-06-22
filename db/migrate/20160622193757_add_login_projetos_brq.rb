class AddLoginProjetosBrq < ActiveRecord::Migration
  def change
  	  add_column :projetos_brqs, :IdtUsuarioGestorCentroCusto, :string
  end
end
