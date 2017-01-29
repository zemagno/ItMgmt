class AddTipoToCadrelatorios < ActiveRecord::Migration
  def self.up
    add_column :cadrelatorios, :tipoExibicao, :integer
    execute %Q{ update cadrelatorios set tipoExibicao=0; }
  end
  def self.down
    remove_column :cadrelatorios, :tipo, :integer
  end

end
