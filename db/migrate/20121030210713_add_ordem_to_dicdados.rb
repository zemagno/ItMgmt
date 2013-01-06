class AddOrdemToDicdados < ActiveRecord::Migration
  def self.up
    add_column :dicdados, :ordem, :integer
  end

  def self.down
    remove_column :dicdados, :ordem
  end
end
