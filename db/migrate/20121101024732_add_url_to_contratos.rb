class AddUrlToContratos < ActiveRecord::Migration
  def self.up
    add_column :contratos, :url, :string
  end

  def self.down
    remove_column :contratos, :url
  end
end
