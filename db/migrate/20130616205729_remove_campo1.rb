class RemoveCampo1 < ActiveRecord::Migration
  def up
  	remove_column :cis, :Campo1
  	remove_column :cis, :Campo2
  	remove_column :cis, :Campo3
  	remove_column :cis, :Campo4
  end

  def down
  end
end
