class AddPerfilToTipocis < ActiveRecord::Migration
  def change
    add_column :tipocis, :perfil, :string
  end
end
