class AddDashBoardToCadrelatorios < ActiveRecord::Migration
  def change
  	add_column :cadrelatorios, :dashboard, :string
  	execute %Q{ Update cadrelatorios  set dashboard="PRODUCAO" where painel; }
  	remove_column :cadrelatorios, :painel
  end
end
