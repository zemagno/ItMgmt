class AddGrupoToIdentities < ActiveRecord::Migration
  def change
    add_column :identities, :ADGrupos, :text,  :limit => 4096

  end
end
