class CreateCriticidades < ActiveRecord::Migration
  def self.up
    create_table :criticidades do |t|
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :criticidades
  end
end
