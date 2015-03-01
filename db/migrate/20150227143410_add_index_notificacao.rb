class AddIndexNotificacao < ActiveRecord::Migration
 def self.up
  	add_index :cis, :notificacao
  	add_index :cis, :Owner
  end

  def self.down
  	remove_index :cis, :notificacao
  	remove_index :cis, :Owner
  end
end
