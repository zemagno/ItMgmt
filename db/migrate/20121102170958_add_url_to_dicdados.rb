class AddUrlToDicdados < ActiveRecord::Migration
  def self.up
    add_column :dicdados, :url, :string
  end

  def self.down
    remove_column :dicdados, :url
  end
end
