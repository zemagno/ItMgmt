class AddCcDebitoToCis < ActiveRecord::Migration
  def change
    add_column :cis, :CCDebito, :string, :limit => 20
    add_column :cis, :ProjetoDebito, :string, :limit => 50
    add_column :cis, :CCCredito, :string, :limit => 20
    add_column :cis, :ProjetoCredito, :string, :limit => 50
    
  end
end
