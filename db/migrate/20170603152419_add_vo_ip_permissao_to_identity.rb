class AddVoIpPermissaoToIdentity < ActiveRecord::Migration
  def change
    add_column :identities, :VoIPPermissao, :string
  end
end
