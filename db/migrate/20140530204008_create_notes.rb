class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.text :notes

      t.timestamps
    end
  end
end
