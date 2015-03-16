class AddTooltipToDicdados < ActiveRecord::Migration
  def change
    add_column :dicdados, :tooltip, :text 
  end
end
