class AddAliasToChecklists < ActiveRecord::Migration
  def change
    add_column :checklists, :alias, :string
  end
end
