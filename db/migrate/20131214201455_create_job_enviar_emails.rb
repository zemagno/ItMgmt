class CreateJobEnviarEmails < ActiveRecord::Migration
  def change
    create_table :job_enviar_emails do |t|
      t.integer :templates_email_id
      t.text :parametro

      t.timestamps
    end
  end
end
