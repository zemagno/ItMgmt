class AddOwnerToTipocis < ActiveRecord::Migration
  def self.up
    add_column :tipocis, :Owner, :string
  end

  def self.down
    remove_column :tipocis, :Owner
  end
end
