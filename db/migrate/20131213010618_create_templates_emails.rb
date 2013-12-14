class CreateTemplatesEmails < ActiveRecord::Migration
  def change
    create_table :templates_emails do |t|
      t.string :tipo
      t.string :template
      t.string :nome

      t.timestamps
    end
  end
end
