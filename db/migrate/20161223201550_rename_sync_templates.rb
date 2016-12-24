class RenameSyncTemplates < ActiveRecord::Migration
  def change
  	rename_column :templates_emails, :sync, :tipo_envio
  end
end
