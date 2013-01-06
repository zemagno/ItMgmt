class AddIndex < ActiveRecord::Migration
  def self.up
  	add_index :relacionamentos, :impactado_id
  	add_index :relacionamentos, :dependente_id
  end

  def self.down
  	remove_index :relacionamentos, :impactado_id
  	remove_index :relacionamentos, :dependente_id
  end

  
end
