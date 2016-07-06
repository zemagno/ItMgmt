class AddFromToTemplatesEmails < ActiveRecord::Migration
  def change
    add_column :templates_emails, :from, :string
    add_column :templates_emails, :subject, :string
    add_column :templates_emails, :cc, :string

  end
end
