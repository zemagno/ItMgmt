class Add < ActiveRecord::Migration
  def change
    add_column :cis, :oldStatusci_id, :integer
  end
end
