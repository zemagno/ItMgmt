class AddStatutToJobEnviarEmails < ActiveRecord::Migration
  def change
    add_column :job_enviar_emails, :status, :string
  end
end
