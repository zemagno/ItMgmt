class AddTipociToCadrelatorios < ActiveRecord::Migration
  def change
    add_column :cadrelatorios, :tipoci_id, :integer
  end
end
