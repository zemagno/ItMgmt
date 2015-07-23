class AddDashBoardToCadrelatorios < ActiveRecord::Migration
  def change
  	add_column :Cadrelatorios, :dashboard, :string
  	execute %Q{ Update cadrelatorios  set dashboard="PRODUCAO" where painel; }
  	remove_column :Cadrelatorios, :painel
  end
end
