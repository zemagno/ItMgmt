class AddJiraToCis < ActiveRecord::Migration
  def self.up
    add_column :cis, :jira, :string
  end

  def self.down
    remove_column :cis, :jira
  end
end
