class AddStatusToNotificacao < ActiveRecord::Migration
  def self.up
    add_column :notificacaos, :status, :string
  end

  def self.down
    remove_column :notificacaos, :status
  end
end
