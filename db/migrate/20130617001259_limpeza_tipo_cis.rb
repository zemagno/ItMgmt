class LimpezaTipoCis < ActiveRecord::Migration
  def up
  	remove_column :tipocis, :defCampo1
    remove_column :tipocis, :defCampo2
	remove_column :tipocis, :defCampo3
	remove_column :tipocis, :defCampo4
end

  def down
  end
end
