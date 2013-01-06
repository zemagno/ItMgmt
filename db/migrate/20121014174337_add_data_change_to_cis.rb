class AddDataChangeToCis < ActiveRecord::Migration
  def self.up
    add_column :cis, :dataChange, :date
  end

  def self.down
    remove_column :cis, :dataChange
  end
end
