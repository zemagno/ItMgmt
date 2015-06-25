class CreateProducaos < ActiveRecord::Migration
  def self.up
    create_table :producaos do |t|
      t.string :job, :limit => 30
      t.integer :id
      t.string :status, :limit => 10
      t.datetime :data
      t.string :detalhe

      t.timestamps
    end
  end

  def self.down
    drop_table :producaos
  end
end
