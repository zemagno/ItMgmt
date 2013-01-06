class CreateTipocis < ActiveRecord::Migration
  def self.up
    create_table :tipocis do |t|
      t.string :tipo

      t.timestamps
    end
  end

  def self.down
    drop_table :tipocis
  end
end
