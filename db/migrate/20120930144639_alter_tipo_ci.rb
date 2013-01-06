class AlterTipoCi < ActiveRecord::Migration
  def self.up
     add_column :tipocis, :Descricao, :string
     add_column :tipocis, :defCampo1, :string
     add_column :tipocis, :defCampo2, :string
     add_column :tipocis, :defCampo3, :string
     add_column :tipocis, :defCampo4, :string
     
  end

  def self.down
     remove_column :tipocis, :Descricao
     remove_column :tipocis, :defCampo1
     remove_column :tipocis, :defCampo2
     remove_column :tipocis, :defCampo3
     remove_column :tipocis, :defCampo4
  end
end
