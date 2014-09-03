class AddParamsToExecChecklist < ActiveRecord::Migration
  def change
    add_column :exec_checklists, :params, :text
  end
end
