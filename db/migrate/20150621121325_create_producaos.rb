class CreateProducaos < ActiveRecord::Migration
  def self.up
    create_table :producaos do |t|
      t.string :job, :limit => 30
      t.string :status, :limit => 10
      t.datetime :data
      t.text :detalhe, :limit => 4096

      t.timestamps
    end
  end

  def self.down
    drop_table :producaos
  end
end
