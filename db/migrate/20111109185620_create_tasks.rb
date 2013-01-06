class CreateTasks < ActiveRecord::Migration
  def self.up
    create_table :tasks do |t|
      t.text :description
      t.string :status
      t.references :author
      t.references :category
      t.references :criticidade
      t.references :site

      t.timestamps
    end
  end

  def self.down
    drop_table :tasks
  end
end
