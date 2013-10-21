class AlterTipoCi < ActiveRecord::Migration
  def self.up
     add_column :tipocis, :Descricao, :string
   
     
  end

  def self.down
     remove_column :tipocis, :Descricao
   end
end
