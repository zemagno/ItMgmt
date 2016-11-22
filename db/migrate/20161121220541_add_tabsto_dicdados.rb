class AddTabstoDicdados < ActiveRecord::Migration
  def change
  	add_column :dicdados, :tab, :string
  end
end
