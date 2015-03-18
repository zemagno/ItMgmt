class AddPainelToCadRelatorios < ActiveRecord::Migration
  def change
    add_column :cadrelatorios, :painel, :boolean
  end
end
