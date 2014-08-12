class AddProvisionarToCis < ActiveRecord::Migration
  def change
    add_column :cis, :provisionar, :boolean
  end
end
