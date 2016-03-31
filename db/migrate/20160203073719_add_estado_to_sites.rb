class AddEstadoToSites < ActiveRecord::Migration
  def change
    add_column :sites, :estado, :string, :limit => 2
  end
end
