class AddIconToStatuscis < ActiveRecord::Migration
  def change
    add_column :statuscis, :icon, :string
  end
end
