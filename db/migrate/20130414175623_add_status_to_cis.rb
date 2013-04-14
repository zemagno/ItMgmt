class AddStatusToCis < ActiveRecord::Migration
  def change
    add_column :cis, :statusci_id, :integer
  end
end
