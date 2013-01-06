class CreateNotificacaos < ActiveRecord::Migration
  def self.up
    create_table :notificacaos do |t|
      t.string :evento
      t.string :email
      
      t.timestamps
    end
  end

  def self.down
    drop_table :notificacaos
  end
end
