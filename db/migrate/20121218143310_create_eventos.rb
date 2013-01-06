class CreateEventos < ActiveRecord::Migration
  def self.up
    create_table :eventos do |t|
      t.string :nome
      t.date :dataInicio
      t.string :status

      t.timestamps
    end
  end

  def self.down
    drop_table :eventos
  end
end
