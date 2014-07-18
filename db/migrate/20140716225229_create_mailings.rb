class CreateMailings < ActiveRecord::Migration
  def change
    create_table :mailings do |t|
      t.string :tag
      t.string :to
      t.string :cc
      t.string :subject
      t.text :body
      t.references :templates_email

      t.timestamps
    end
    add_index :mailings, :templates_email_id
  end
end
