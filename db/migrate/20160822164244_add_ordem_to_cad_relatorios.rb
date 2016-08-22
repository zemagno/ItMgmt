class AddOrdemToCadRelatorios < ActiveRecord::Migration
  def change
    add_column :cadrelatorios, :ordem, :integer,  :default => 0
  end
end
