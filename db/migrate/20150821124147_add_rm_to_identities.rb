class AddRmToIdentities < ActiveRecord::Migration
  def change
    add_column :identities, :RMLogin, :string,  :limit => 30
    add_column :identities, :RMDataAdmissao, :datetime
    add_column :identities, :RMDataDemissao, :datetime
    add_index :identities, :RMLogin
  end
end
