class AddDocChangeToCis < ActiveRecord::Migration
  def self.up
    add_column :cis, :DocChange, :string
  end

  def self.down
    remove_column :cis, :DocChange
  end
end
