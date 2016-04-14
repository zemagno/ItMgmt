class CreateComandosAutomacaos < ActiveRecord::Migration
  def change
    create_table :comandos_automacaos do |t|
      t.string :comando, :limit => 30
      t.string :parametro, :limit => 30
      t.text :resultado
      t.integer :status
      t.string :target, :limit => 30

      t.timestamps
    end
  end
end
