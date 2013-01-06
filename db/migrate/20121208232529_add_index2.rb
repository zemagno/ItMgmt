class AddIndex2 < ActiveRecord::Migration
  def self.up

  	add_index :dicdados, :tipoci_id
  	add_index :cis, :chave
  	add_index :contratos, :codcontrato  
  end

  def self.down
  
  	remove_index :dicdados, :tipoci_id
  	remove_index :cis, :chave
  	remove_index :contratos, :codcontrato
  end
end
