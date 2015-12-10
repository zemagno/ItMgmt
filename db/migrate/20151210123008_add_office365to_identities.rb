class AddOffice365toIdentities < ActiveRecord::Migration
  def change

	add_column :identities, :O365DisplayName, :string, :limit => 50 
	add_column :identities, :O365UserPrincipalName, :string, :limit => 50 
	add_column :identities, :O365AccountSku, :string, :limit => 50 
	add_column :identities, :O365SWAY, :string, :limit => 50 
	add_column :identities, :O365INTUNE_O365, :string, :limit => 50 
	add_column :identities, :O365YAMMER_ENTERPRISE, :string, :limit => 50 
	add_column :identities, :O365Lync_Online, :string, :limit => 50 
	add_column :identities, :O365Sharepoint_Online, :string, :limit => 50 
	add_column :identities, :O365Exchange_Online, :string, :limit => 50
end
end
