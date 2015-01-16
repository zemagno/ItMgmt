class AddIndexTocadsurveys < ActiveRecord::Migration
  def up
  	add_index :cadsurveys, :key
  end

  def down
  end
end
