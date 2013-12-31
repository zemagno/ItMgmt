class AddSubtipoToTemplatesEmail < ActiveRecord::Migration
  def change
    add_column :templates_emails, :subtipo, :string
  end
end
