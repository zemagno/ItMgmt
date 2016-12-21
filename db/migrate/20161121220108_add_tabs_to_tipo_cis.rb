class AddTabsToTipoCis < ActiveRecord::Migration
  def change
    add_column :tipocis, :tab, :string
  end
end
