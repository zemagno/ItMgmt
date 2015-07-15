class CreateLogDesligamentos < ActiveRecord::Migration
  def change
    create_table :log_desligamentos do |t|
      t.string :ip
      t.string :login
      t.date :data

      t.timestamps
    end
  end
end
