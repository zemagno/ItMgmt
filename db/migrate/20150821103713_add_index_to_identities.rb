class AddIndexToIdentities < ActiveRecord::Migration
  def change
  	add_index :identities, :login
  	add_index :identities, :ADUser
  	add_index :identities, :GoogleprimaryEmail
  end
end
