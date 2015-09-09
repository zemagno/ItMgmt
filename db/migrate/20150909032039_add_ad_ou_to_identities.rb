class AddAdOuToIdentities < ActiveRecord::Migration
  def change
    add_column :identities, :ADDN, :string
  end
end
