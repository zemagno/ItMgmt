class AddTipoHerancaToHerancaChecklists < ActiveRecord::Migration
  def change
    add_column :heranca_checklists, :tipo_heranca, :integer
  end
end
