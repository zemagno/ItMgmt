class AddzToidentities < ActiveRecord::Migration
  def change
   add_column :identities, :ZMailUser, :string,  :limit => 30
   add_column :identities, :ZMailStatus, :string
   add_column :identities, :ZMailUltimologon, :datetime
   add_column :identities, :ZMailRedirect, :string
   add_column :identities, :ZMailLocalDeliveryDisabled, :string
   add_column :identities, :ZimbraUser, :string,  :limit => 30
   add_column :identities, :ZimbraStatus, :string
   add_column :identities, :ZimbraUltimologon,  :datetime
   add_column :identities, :ZimbraRedirect, :string
   add_column :identities, :ZimbraLocalDeliveryDisabled, :string
 end
end
