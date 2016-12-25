class AddLoginToUsers < ActiveRecord::Migration
  def change
    add_column :users, :internal_login, :string
  end
end
