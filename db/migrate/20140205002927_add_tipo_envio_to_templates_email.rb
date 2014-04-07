class AddTipoEnvioToTemplatesEmail < ActiveRecord::Migration
  def change
    add_column :templates_emails, :sync, :boolean
  end
end
