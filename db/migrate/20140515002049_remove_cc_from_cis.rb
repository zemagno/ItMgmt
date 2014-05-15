class RemoveCcFromCis < ActiveRecord::Migration
  def up
    remove_column :cis, :CC
  end

  def down
    add_column :cis, :CC, :string
  end
end
