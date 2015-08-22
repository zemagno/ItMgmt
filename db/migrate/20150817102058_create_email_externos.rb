class CreateEmailExternos < ActiveRecord::Migration
  def change
    create_table :email_externos do |t|
      t.string :login
      t.string :provedor

      t.timestamps
    end
  end
end
