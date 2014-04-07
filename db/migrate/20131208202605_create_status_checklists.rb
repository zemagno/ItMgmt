class CreateStatusChecklists < ActiveRecord::Migration
  def change
    create_table :status_checklists do |t|
      t.string :status
      t.string :icon

      t.timestamps
    end
  end
end
