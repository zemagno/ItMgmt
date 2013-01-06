class AddExpiracaoToTask < ActiveRecord::Migration
  def self.up
    add_column :tasks, :Expiracao, :timestamp
  end

  def self.down
    remove_column :tasks, :Expiracao
  end
end
