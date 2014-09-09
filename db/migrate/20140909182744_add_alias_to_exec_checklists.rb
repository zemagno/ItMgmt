class AddAliasToExecChecklists < ActiveRecord::Migration
  def change
    add_column :exec_checklists, :alias, :string
  end
end
