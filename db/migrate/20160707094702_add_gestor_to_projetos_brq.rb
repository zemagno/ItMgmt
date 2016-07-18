class AddGestorToProjetosBrq < ActiveRecord::Migration
  def change
    add_column :projetos_brqs, :IdtUsuarioGestorProjeto, :string
  end
end
