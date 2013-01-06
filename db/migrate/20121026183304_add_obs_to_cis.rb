class AddObsToCis < ActiveRecord::Migration
  def self.up
    add_column :cis, :obs, :string
  end

  def self.down
    remove_column :cis, :obs
  end
end
