class MudarSyncTemplates < ActiveRecord::Migration
  def change
  	change_column :templates_emails, :sync, :integer;   
  end
end
