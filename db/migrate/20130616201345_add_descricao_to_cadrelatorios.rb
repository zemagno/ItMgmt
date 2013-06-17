class AddDescricaoToCadrelatorios < ActiveRecord::Migration
  def change
    add_column :cadrelatorios, :descricao, :string
  end
end
