class AddLogonToAuthors < ActiveRecord::Migration
  def self.up
    add_column :authors, :Logon, :string
  end

  def self.down
    remove_column :authors, :Logon
  end
end
