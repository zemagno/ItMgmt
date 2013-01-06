class AddUrlToCis < ActiveRecord::Migration
  def self.up
    add_column :cis, :url, :string
  end

  def self.down
    remove_column :cis, :url
  end
end
