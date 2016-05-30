class AddTipodoGrupo < ActiveRecord::Migration
  def change
    add_column :grupos, :owner, :string
    add_column :grupos, :tipoGrupo, :string
    add_column :grupos, :parametros, :string
  end
end
