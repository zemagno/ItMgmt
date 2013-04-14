class CreateStatuscis < ActiveRecord::Migration
  def change
    create_table :statuscis do |t|
      t.string :status

      t.timestamps
    end
  end
end
