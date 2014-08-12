class CreateEvents < ActiveRecord::Migration
  def self.up
    create_table :events do |t|
      t.string :tipo, :limit => 20
      t.string :subtipo, :limit => 40
      t.string :nivel, :limit => 10
      t.string :valor
      t.timestamps
    end
  end

  def self.down
    drop_table :events
  end
end
